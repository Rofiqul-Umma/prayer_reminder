import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/features/get_prayer/api/get_prayer_api.dart';
import 'package:prayer_reminder/features/get_prayer/model/get_prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/model/prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';

class GetPrayerViewModel extends Cubit<GetPrayerState> {
  final GetPrayerApi getPrayerApi;
  GetPrayerViewModel(this.getPrayerApi) : super(GetPrayerInitialState());

  // function for get prayer nearest current time
  Future<void> getNearestPrayerTime(String address) async {
    emit(GetPrayerLoadingState());
    final result = await getPrayerApi.getPrayerTimes(
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
      address,
    );
    TimeOfDay currentTime = TimeOfDay.now();
    // Convert current time to 24-hour format
    String formattedTime =
        "${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}";
    // Check nearest prayer time from api result
    result.fold(
      (error) => emit(GetPrayerErrorState(error)), // Handle error
      (data) {
        final prayer = GetPrayerModel.fromJson(data);
        List<PrayerModel> listPrayer = [];
        listPrayer.add(
          PrayerModel(name: "Subuh", time: prayer.data!.timings!.fajr),
        );
        listPrayer.add(
          PrayerModel(name: "Dzuhur", time: prayer.data!.timings!.dhuhr),
        );
        listPrayer.add(
          PrayerModel(name: "Ashar", time: prayer.data!.timings!.asr),
        );
        listPrayer.add(
          PrayerModel(name: "Maghrib", time: prayer.data!.timings!.maghrib),
        );
        listPrayer.add(
          PrayerModel(name: "Isya", time: prayer.data!.timings!.isha),
        );
        String nearestPrayerTime = '';
        String nearestPrayerName = '';
        for (var prayer in listPrayer) {
          if (prayer.time.compareTo(formattedTime) >= 0) {
            nearestPrayerTime = prayer.time;
            nearestPrayerName = prayer.name;
            break;
          }
        }

        if (nearestPrayerTime.isEmpty) {
          nearestPrayerTime = "No more prayers today";
          nearestPrayerName = "All prayers are done";
        }

        emit(
          GetPrayerSuccessState(
            PrayerModel(name: nearestPrayerName, time: nearestPrayerTime),
          ), // Handle success
        );
      },
    );
  }
}
