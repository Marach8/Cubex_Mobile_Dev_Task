import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Custom exception class for handling exceptions in the API client
class CBException implements Exception {
  CBException(this.message, {this.code});

  final dynamic message;
  final int? code;

  static CBException getException(dynamic err) {
    if (err is SocketException) {
      return InternetConnectException(kInternetConnectionError, 0);
    } else if (err is TimeoutException) {
      return OtherExceptions(err.message, 0);
    } else if (err is http.Response) {
      switch (err.statusCode) {
        case 500:
        case 502:
          return InternalServerException(statusCode: err.statusCode);
        case 400:
        case 403:
        case 401:
        case 404:
        case 409:
        case 413:
          return OtherExceptions(
              jsonDecode(err.body)['message'] ?? kDefaultError, err.statusCode);
        default:
          return OtherExceptions(jsonDecode(err.body)['message'] ?? kDefaultError, err.statusCode);
      }
    } else {
      return OtherExceptions(kDefaultError, 0);
    }
  }
}

class OtherExceptions implements CBException {
  OtherExceptions(this.newMessage, this.statusCode);

  final dynamic newMessage;
  final int? statusCode;

  @override
  String toString() => message;

  @override
  dynamic get message => newMessage;

  @override
  int? get code => statusCode;
}

class FormatException implements CBException {
  @override
  String toString() => message;

  @override
  int? get code => null;

  @override
  String get message => kFormatError;
}

class InternetConnectException implements CBException {
  InternetConnectException(this.newMessage, this.statusCode);

  final String newMessage;
  final int statusCode;

  @override
  String toString() => message;

  @override
  String get message => newMessage;

  @override
  int? get code => statusCode;
}

class InternalServerException implements CBException {
  final int? statusCode;

  InternalServerException({required this.statusCode});

  @override
  String toString() => 'Internal Server Error ($statusCode)';

  @override
  String get message => 'Internal Server Error';

  @override
  int? get code => statusCode;
}


class UnAuthorizedException implements CBException {
  final int? statusCode;

  UnAuthorizedException({required this.statusCode});
  @override
  String toString() => message;

  @override
  String get message => kInvalidCredential;

  @override
  int? get code => statusCode;
}

class CacheException implements Exception {
  CacheException(this.message, this.statusCode) : super();

  String message;
  final int? statusCode;

  @override
  String toString() => message;
}

// exceptions messages
const kInternetConnectionError = 'No internet connection...';
const kTimeOutError = 'Connection timeout. Please check your internet connection.';
const kServerError = 'Something went wrong, try again.';
const kFormatError = 'Unable to process data at this time.';
const kInvalidCredential = 'Invalid Authentication Credential(s)!';
const kDefaultError = 'Oops something went wrong!';
const kBadRequestError = 'Invalid Credential(s)!';
const kFileTooLarge = 'File too large.';
const kUserNotFound = 'User does not exist!';
const kNotFoundError = 'An error occured, please try again.';
const kRequestCancelledError = 'Request to server was cancelled.';