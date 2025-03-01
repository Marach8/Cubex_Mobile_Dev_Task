import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CBCountryDetailedScreen extends StatelessWidget {
  final String countryName;
  const CBCountryDetailedScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return CBAnnotatedRegion(
      child: Scaffold(
        appBar: CBAppBar(
          title: Text(
            countryName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.keyboard_backspace)
          ),
        ),
      
        body: Center(
          child: BlocConsumer<CountryDetailBloc, CountryDetailState>(
            listenWhen: (_, curr) => curr is CountryDetailErrorState,
            listener: (_, curr){
              if(curr is CountryDetailErrorState){
                showAppNotification(
                  context: context,
                  icon: Icon(Icons.warning,),
                  text: curr.errorMsg
                );
              }
            },
            builder: (_, state) {
              final isLoading = state is CountryDetailLoadingState;
              final hasError = state is CountryDetailErrorState;
              final hasData = state is CountryDetailDataState;                
        
              CountryData? country;
              Map<String, String>? countryImageDetails;
              String? errorMsg;
        
              if (hasData) {
                country = state.country;
                countryImageDetails = state.countryImageDetails;
              }
        
              if (hasError) {
                errorMsg = state.errorMsg;
              }
        
              return CBScalingAnimatedSwitcher(
                duration: 1000,
                child: isLoading ? CBLoadingIndicator(key: ValueKey(0)) :
                  hasError ? CBErrorStateWidget(
                    text: errorMsg, key: ValueKey(1)
                  ) : hasData ?
                  SingleChildScrollView(
                    key: ValueKey(2),
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, kBottomNavigationBarHeight),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        RenderCountryImages(countryImageDetails: countryImageDetails),
                        
                        const SizedBox(height: 10),
                        BlocBuilder<DotIndicatorCubit, int>(
                          builder: (_, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                countryImageDetails?.length ?? 3,
                                (index) {
                                  final isSelected = index == state;
                                  return CBContainer(
                                    margin: const EdgeInsets.only(right: 5),
                                    color: CBHelperFuncs.getColor(context, isSelected),
                                    height: 4, radius: 5,
                                    width: isSelected ? 30 : 4,
                                    child: const SizedBox.shrink(),
                                  );
                                }
                              )
                            );
                          }
                        ),
                        const SizedBox(height: 30),
                  
                        ...(country ?? CountryData()).mapOfFields.entries.map(
                          (entry){
                            String entryVal = '';
                            (entry.value.contains('null') || entry.value.isEmpty) ?
                              entryVal = CBStrings.DATA_UNAVAILABLE : entryVal = entry.value;
                            return RenderCountryInfo(
                              keyItem: entry.key,
                              value: entryVal
                            );
                          }
                        )
                      ],
                    ),
                  ) : CBErrorStateWidget(key: ValueKey(3))
              );
            }
          ),
        )
      ),
    );
  }
}
