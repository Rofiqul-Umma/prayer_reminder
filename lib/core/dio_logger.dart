import 'dart:developer';
import 'package:dio/dio.dart';

class DioLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('*** Request ***');
    log('URI: ${options.uri}');
    log('Method: ${options.method}');
    log('Headers: ${options.headers}');
    log('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('*** Response ***');
    log('URI: ${response.requestOptions.uri}');
    log('Status Code: ${response.statusCode}');
    log('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('*** Error ***');
    log('URI: ${err.requestOptions.uri}');
    log('Message: ${err.message}');
    if (err.response != null) {
      log('Status Code: ${err.response?.statusCode}');
      log('Data: ${err.response?.data}');
    } else {
      log('No response data');
    }
    super.onError(err, handler);
  }
}
