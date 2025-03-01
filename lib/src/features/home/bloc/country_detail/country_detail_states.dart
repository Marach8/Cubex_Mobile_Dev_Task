import '../../data/home_data_export.dart';

abstract class CountryDetailState{}


class CountryDetailEmptyState extends CountryDetailState{}

class CountryDetailLoadingState extends CountryDetailState{}

class CountryDetailDataState extends CountryDetailState{
  final CountryData? country;
  final List<List<MapEntry<String, String>>> groupedCountryInfo;
  final Map<String, String> countryImageDetails;
  CountryDetailDataState({
    this.country,
    required this.groupedCountryInfo,
    required this.countryImageDetails
  });
}

class CountryDetailErrorState extends CountryDetailState{
  final String errorMsg;
  final dynamic data;
  CountryDetailErrorState({required this.errorMsg, this.data});
}