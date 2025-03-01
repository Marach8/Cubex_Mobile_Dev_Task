import 'package:cubex_mobile_dev_task/src/features/home/data/models/countries_list_response_model.dart' show Country;

abstract class CountriesListState{}


class CountriesListEmptyState extends CountriesListState{}

class CountriesListLoadingState extends CountriesListState{}

class CountriesListDataState extends CountriesListState{
  final List<Country> countries;
  CountriesListDataState({required this.countries});
}

class CountriesListErrorState extends CountriesListState{
  final String errorMsg;
  final dynamic data;
  CountriesListErrorState({required this.errorMsg, this.data});
}