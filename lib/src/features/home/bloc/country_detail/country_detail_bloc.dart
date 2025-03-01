import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState>{
  final HomeRepo _homeRepo;
  CountryDetailBloc({HomeRepo? homeRepo}):
    _homeRepo = homeRepo ?? HomeRepoImpl(),

    super(CountryDetailEmptyState()){
      on<FetchCountryEvent>((event, emit)async{
        emit(CountryDetailLoadingState());

        try{
          final response = await _homeRepo.fetchCountryDetail(event.countryName);
          response.when(
            successful: (result){
              final country = result.data?.country?.first ?? CountryData();
              final countryImageDetails = {
                CBStrings.FLAG: country.flags?.svg ?? '',
                CBStrings.MAP: country.maps?.googleMaps ?? '',
                CBStrings.COAT_OF_ARMS: country.coatOfArms?.svg ?? '',
              };
              
              final groupedCountryInfo = CBHelperFuncs.groupMapEntries(country.mapOfFields);

              emit(
                CountryDetailDataState(
                  country: country,
                  groupedCountryInfo: groupedCountryInfo,
                  countryImageDetails: countryImageDetails
                )
              );
            },
            error: (error) {
              if(error.error.message.toLowerCase().contains('null')){
                emit(
                  CountryDetailErrorState(errorMsg: CBStrings.ERR_OCCURED)
                );
                return;
              }
              emit(
                CountryDetailErrorState(errorMsg: error.error.message)
              );
            }
          );
        }
        
        catch (e){
          if(e.toString().toLowerCase().contains('null')){
            emit(
              CountryDetailErrorState(errorMsg: CBStrings.ERR_OCCURED)
            );
            return;
          }
          emit(
            CountryDetailErrorState(errorMsg: e.toString())
          );
        }
      });
    }
}
