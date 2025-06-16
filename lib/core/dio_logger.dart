import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('*** Request ***');
    debugPrint('URI: ${options.uri}');
    debugPrint('Method: ${options.method}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('*** Response ***');
    debugPrint('URI: ${response.requestOptions.uri}');
    debugPrint('Status Code: ${response.statusCode}');
    debugPrint('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('*** Error ***');
    debugPrint('URI: ${err.requestOptions.uri}');
    debugPrint('Message: ${err.message}');
    if (err.response != null) {
      debugPrint('Status Code: ${err.response?.statusCode}');
      debugPrint('Data: ${err.response?.data}');
    } else {
      debugPrint('No response data');
    }
    super.onError(err, handler);
  }
}
