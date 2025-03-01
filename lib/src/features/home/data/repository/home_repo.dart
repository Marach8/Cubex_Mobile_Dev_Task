import 'package:cubex_mobile_dev_task/src/global_export.dart';

abstract interface class HomeRepo {

  Future<ApiResponse<CountriesResponseModel>> fetchCountries();

  Future<ApiResponse<CountryDetailResponseModel>> fetchCountryDetail(String name);

}