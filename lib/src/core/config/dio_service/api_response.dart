import 'package:cubex_mobile_dev_task/src/core/config/exceptions/exception.dart';

abstract class ApiResponse<T> {
  const ApiResponse();

  R when<R>({
    required R Function(Successful<T> successful) successful,
    required R Function(Error<T> error) error,
  });
}

class Successful<T> extends ApiResponse<T> {
  final T? data;
  Successful({this.data}) : super();

  @override
  R when<R>({
    required R Function(Successful<T> successful) successful,
    required R Function(Error<T> error) error,
  }) {
    return successful(this);
  }
}

class Error<T> extends ApiResponse<T> {
  final CBException error;
  Error({required this.error}) : super();

  @override
  R when<R>({
    required R Function(Successful<T> successful) successful,
    required R Function(Error<T> error) error,
  }) {
    return error(this);
  }
}






class GenericResponseModel {
  GenericResponseModel({
    this.isSuccessful,
    this.responseMessage,
    this.entityData
  });

  bool? isSuccessful;
  String? responseMessage;
  dynamic entityData;

  GenericResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccessful = json['success'];
    responseMessage = json['message'];
    entityData = json['entity'];
  }
}
