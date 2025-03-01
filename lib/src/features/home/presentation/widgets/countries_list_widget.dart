import 'package:cubex_mobile_dev_task/src/features/home/presentation/views/country_detailed_screen.dart';
import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBCountryListView extends StatelessWidget {
  const CBCountryListView({super.key});

  @override
  Widget build(context) {
    final brightness = CBHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;

    return BlocConsumer<CountriesListBloc, CountriesListState>(
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
          return CBLoadingIndicator();
        }
        if(hasError){
          return CBErrorStateWidget(text: state.errorMsg);
        }
        if(countriesEmtpy){
          return CBErrorStateWidget(text: CBStrings.NO_RECORDS_FOUND);
        }

        final countries = (state as CountriesListDataState).countries;

        return Expanded(
          child: ListView.builder(
            itemCount: countries.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, listIndex){
              final country = countries.elementAtOrNull(listIndex);
              
              return CBContainer(
                onTap: (){
                  context.read<DotIndicatorCubit>().reset();
                  context.read<CountryDetailBloc>().add(FetchCountryEvent(country?.name?.official ?? ''));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CBCountryDetailedScreen(countryName: country?.name?.official ?? '')
                    )
                  );
                },
                color: inDarkMode ? CBColors.black : CBColors.white, 
                radius: 8,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                border: Border.all(
                  width: 0.2,
                  color: inDarkMode ? CBColors.white : CBColors.hex1B1B1B
                ),
                child: Row(
                  children: [
                    CBFlagDisplay(
                      flagUrl: country?.flags?.svg ?? '',
                      fit: BoxFit.cover,
                    ),
                    
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CBFilterWidget(
                            providerIdentity: CBStrings.SEARCH_KEY,
                            title: country?.name?.official ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            country?.capital?.first ?? '',
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),        
                  ],
                ),
              );
            }
          ),
        );
      }
    );
  }
}