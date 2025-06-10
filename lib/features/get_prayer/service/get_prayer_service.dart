import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prayer_reminder/constant/endpoint.dart';
import 'package:prayer_reminder/core/dio_helper.dart';

class GetPrayerService {
  Future<Either<String, Response>> getPrayerTimes(
    String date,
    String address,
  ) async {
    try {
      final response = await DioHelper.getData(
        url: "${Endpoint.GET_PRAYER_TIMES}/$date",
        queryParameters: {
          'address': address,
          'method': '20',
          'calendarMethod': 'HJCoSA',
          'timezonestring': 'Asia/Jakarta',
        },
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left('Error: ${response}');
      }
    } catch (e) {
      return Left('Error fetching prayer times: $e');
    }
  }
}
