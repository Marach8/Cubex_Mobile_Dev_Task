import 'package:cubex_mobile_dev_task/src/global_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkServiceImpl implements NetworkService {
  
  static final NetworkServiceImpl _instance = NetworkServiceImpl._internal();
  factory NetworkServiceImpl() => _instance;

  final Dio _dioClient;

  NetworkServiceImpl._internal() : _dioClient = Dio() {
    final baseOptions = BaseOptions(
      baseUrl: CBUrls.BASE_URL,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: 'application/json',
      validateStatus: _validateStatus,
    );

    _dioClient.options = baseOptions;

    final presetHeaders = <String, String>{
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dioClient.options.headers = presetHeaders;
    _dioClient.interceptors.addAll(
      [
        if (kDebugMode)
          LogInterceptor(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
          ),
      ],
    );
  }


  @override
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dioClient.get(
      uri,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dioClient.post(
      uri,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  static bool _validateStatus(int? status) {
    return status! == 200 || status == 201;
  }
}



extension ResponseExtension on Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}