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
    // CBHelperFuncs.disposeDebouncer();
    super.dispose();
  }


  @override
  Widget build(context) {
    return CBAnnotatedRegion(
      child: GestureDetector(
        onVerticalDragUpdate: (details) async{
          // final inFilterMode = ref.read(globalStringProvider(CBStrings.SEARCH_KEY)).isNotEmpty;
          if (details.primaryDelta! > 0){
            context.read<CountriesListBloc>().add(FetchCountriesEvent());
          }
        },
        child: Scaffold(
          appBar: CBAppBar(
            title: Text(
              CBStrings.ALL_COUNTRIES,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CountriesListBloc, CountriesListState>(
                  
                  builder: (_, state) {
                    bool enabled = true;
                    //final users = ref.watch(usersProvider);
                    //final inFilterMode = ref.read(globalStringProvider(CBStrings.SEARCH_KEY)).isNotEmpty;
                    
                    //We want to disable the textField only when we are loading and 
                    //when we weren't able to fetch data from the fetchUsers api call
                    // if(users is AsyncLoading){enabled = false;}
                    // else if((users.value ?? []).isEmpty && !inFilterMode){enabled = false;}
                    
                    return CBTextField(
                      enabled: enabled,
                      hintText: CBStrings.ENETER_SEARCH_KEY,
                      // onChanged: (text) => CBHelperFuncs.callDebouncer(
                      //   200,
                      //   () => ref.read(usersProvider.notifier).filterUsers(text)
                      // )
                    );
                  }
                ),
                    
                const SizedBox(height: 20),
                const CBCountryListView(),
              ],
            ),
          )
        ),
      ),
    );
  }
}
