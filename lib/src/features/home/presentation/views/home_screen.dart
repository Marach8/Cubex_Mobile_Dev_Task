import 'dart:ui';
import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBHomeScreen extends StatefulWidget {
  const CBHomeScreen({super.key});

  @override
  State<CBHomeScreen> createState() => _CBHomeScreenState();
}

class _CBHomeScreenState extends State<CBHomeScreen> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _performInitializations());
  }

  void _performInitializations(){
    context.read<CountriesListBloc>().add(FetchCountriesEvent());
  }


  @override
  void dispose(){
    CBHelperFuncs.disposeDebouncer();
    super.dispose();
  }


  @override
  Widget build(context) {
    return CBAnnotatedRegion(
      child: Scaffold(

        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                floating: true,
                title: Text(
                  CBStrings.ALL_COUNTRIES,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
          
              BlocBuilder<CountriesListBloc, CountriesListState>(
                builder: (_, state) {
                  final showField = state is CountriesListDataState
                    || state is CountriesListEmptyState;
                  
                  if(!showField) return const SliverToBoxAdapter(child: SizedBox.shrink());
          
                  return SliverPersistentHeader(
                    pinned: true,
                    delegate: CBSliverHeader(
                      maxExt: 70, minExt: 70, rebuild: false,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: CBContainer(
                            height: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: CBTextField(
                              hintText: CBStrings.ENETER_SEARCH_KEY,
                              onChanged: (text) => CBHelperFuncs.callDebouncer(
                                500,
                                (){
                                  context.read<CountriesListBloc>().add(FilterCountriesEvent(searchKey: text));
                                  context.read<SearchkeyCubit>().updateSearchKey(text);
                                }
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              )
            ],
          
          
            body: BlocConsumer<CountriesListBloc, CountriesListState>(
              listenWhen: (_, curr) => curr is CountriesListErrorState,
              listener: (_, curr){
                if(curr is CountriesListErrorState){
                  showAppNotification(
                    context: context,
                    icon: Icon(Icons.warning,),
                    text: curr.errorMsg
                  );
                }
              },
              builder: (_, state) {
                final isLoading = state is CountriesListLoadingState;
                final hasError = state is CountriesListErrorState;
                final countriesEmtpy = state is CountriesListEmptyState;
                
                if(isLoading){
                  return Center(child: CBLoadingIndicator());
                }
                if(hasError){
                  return Center(
                    child: CBErrorStateWidget(
                      onRefresh: () => context.read<CountriesListBloc>().add(FetchCountriesEvent()),
                    ),
                  );
                }
                if(countriesEmtpy){
                  return Center(child: CBErrorStateWidget(text: CBStrings.NO_RECORDS_FOUND));
                }
          
                final countries = (state as CountriesListDataState).countries;
          
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CBCountryListView(countries: countries),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
