import 'package:cubex_mobile_dev_task/src/global_export.dart';

class CountriesListBloc extends Bloc<CountriesListEvent, CountriesListState>{
  final HomeRepo _homeRepo;
  CountriesListBloc({HomeRepo? homeRepo}):
    _homeRepo = homeRepo ?? HomeRepoImpl(),

    super(CountriesListEmptyState()){
      List<Country> cachedCountries = [];

      on<FetchCountriesEvent>((_, emit)async{
        emit(CountriesListLoadingState());

        try{
          final response = await _homeRepo.fetchCountries();
          response.when(
            successful: (result){
              cachedCountries = result.data?.countries ?? [];
              emit(
                CountriesListDataState(countries: result.data?.countries ?? [])
              );
            },
            error: (error){
              if(error.error.message.toLowerCase().contains('null')){
                emit(
                  CountriesListErrorState(errorMsg: CBStrings.ERR_OCCURED)
                );
                return;
              }
              emit(
                CountriesListErrorState(errorMsg: error.error.message)
              );
            }
          );
        }
        
        catch (e){
          if(e.toString().toLowerCase().contains('null')){
            emit(
              CountriesListErrorState(errorMsg: CBStrings.ERR_OCCURED)
            );
            return;
          }
          emit(
            CountriesListErrorState(errorMsg: e.toString())
          );
        }
      });
      

      on<FilterCountriesEvent>((event, emit)async{
        final searchKey = event.searchKey;

        emit(CountriesListLoadingState());

        if(searchKey.isEmpty){
          emit(CountriesListDataState(countries: cachedCountries));
          return;
        }

        final filteredCountries = cachedCountries.where(
          (country) => (country.name?.official?.toLowerCase().contains(searchKey.toLowerCase()) ?? false)
        ).toList();
        

        if(filteredCountries.isEmpty){
          emit(CountriesListEmptyState());
          return;
        }

        emit(CountriesListDataState(countries: filteredCountries));
      });
    }
}
