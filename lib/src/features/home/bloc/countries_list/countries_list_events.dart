abstract class CountriesListEvent{}

class FetchCountriesEvent extends CountriesListEvent{}

class FilterCountriesEvent extends CountriesListEvent{
  final String searchKey;

  FilterCountriesEvent({required this.searchKey});
}
