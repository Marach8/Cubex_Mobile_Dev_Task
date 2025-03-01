abstract class CountryDetailEvent{}

class FetchCountryEvent extends CountryDetailEvent{
  final String countryName;
  FetchCountryEvent(this.countryName);
}