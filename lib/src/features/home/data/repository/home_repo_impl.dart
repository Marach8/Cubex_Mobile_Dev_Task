import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'dart:developer' as marach show log;


class HomeRepoImpl implements HomeRepo {
  final NetworkService _networkService;

  static final HomeRepoImpl _instance = HomeRepoImpl._internal();

  HomeRepoImpl._internal() : _networkService = NetworkServiceImpl();

  factory HomeRepoImpl() => _instance;


  @override
  Future<ApiResponse<CountriesResponseModel>> fetchCountries() async {
    try {
      final response = await _networkService.get(CBUrls.GET_COUNTRIES);

      return Successful(
        data: CountriesResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CBException.getException(e));
    }
  }



  @override
  Future<ApiResponse<CountryDetailResponseModel>> fetchCountryDetail(String name)async{
    try {
      final response = await _networkService.get(
        '${CBUrls.GET_A_COUNTRY}$name'
      );
      marach.log(response.data.toString());

      return Successful(
        data: CountryDetailResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CBException.getException(e));
    }
  }
}
