import 'package:dio/dio.dart';

abstract class NetworkService {
  /// get
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  });

  /// post
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

}