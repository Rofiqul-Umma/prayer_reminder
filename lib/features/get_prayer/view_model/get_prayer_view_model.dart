import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/features/get_prayer/service/get_prayer_service.dart';
import 'package:prayer_reminder/features/get_prayer/model/get_prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/model/prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';

class GetPrayerViewModel extends Cubit<GetPrayerState> {
  final GetPrayerService getPrayerApi;
  GetPrayerViewModel(this.getPrayerApi) : super(GetPrayerInitialState());

  List<PrayerModel> prayers = [];

  // function for get prayer nearest current time
  Future<void> getPrayers(String address) async {
    emit(GetPrayerLoadingState());
    final result = await getPrayerApi.getPrayerTimes(
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
      address,
    ); // Check nearest prayer time from api result
    result.fold(
      (error) => emit(GetPrayerErrorState(error)), // Handle error
      (data) {
        final prayer = GetPrayerModel.fromJson(data.data);

        if (prayer.data == null) {
          emit(GetPrayerErrorState("No data found"));
          return;
        }

        if (prayer.data!.timings == null) {
          emit(GetPrayerErrorState("No prayer times found"));
          return;
        }

        prayers = [
          PrayerModel(name: "Subuh", time: prayer.data!.timings!.fajr),
          PrayerModel(name: "Dzuhur", time: prayer.data!.timings!.dhuhr),
          PrayerModel(name: "Ashar", time: prayer.data!.timings!.asr),
          PrayerModel(name: "Maghrib", time: prayer.data!.timings!.maghrib),
          PrayerModel(name: "Isya", time: prayer.data!.timings!.isha),
        ];

        // Find next prayer or current prayer
        final now = DateTime.now();
        PrayerModel? nextPrayer;
        for (final prayerModel in prayers) {
          // Parse time string to DateTime today
          final timeParts = prayerModel.time.split(':');
          if (timeParts.length < 2) continue;
          final prayerTime = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(timeParts[0]),
            int.parse(timeParts[1]),
          );
          if (prayerTime.isAfter(now)) {
            nextPrayer = prayerModel;
            break;
          }
        }
        // If all prayer times have passed, next is the first prayer of tomorrow
        nextPrayer ??= prayers.first;

        emit(GetPrayerSuccessState(nextPrayer));
      },
    );
  }
}
