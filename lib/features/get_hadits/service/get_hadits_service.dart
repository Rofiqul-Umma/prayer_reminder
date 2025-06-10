import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prayer_reminder/constant/endpoint.dart';
import 'package:prayer_reminder/core/dio_helper.dart';

class GetHaditsService {
  void init() {
    DioHelper.init(baseUrl: Endpoint.BASE_URL_HADITS);
  }

  Future<Either<String, Response>> getHadits() async {
    try {
      final response = await DioHelper.getData(url: Endpoint.GET_HADITS);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left('Error: $response');
      }
    } catch (e) {
      return Left('Error fetching hadits: $e');
    }
  }
}
