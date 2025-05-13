import 'package:dio/dio.dart';
import 'package:prayer_reminder/constant/endpoint.dart';
import 'package:prayer_reminder/core/dio_logger.dart';

class DioHelper {
  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoint.BASE_URL, // Replace with your base URL
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _dio.interceptors.add(DioLogger());
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get(
      url,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }
}
