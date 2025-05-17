import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/features/get_prayer/api/get_prayer_api.dart';
import 'package:prayer_reminder/features/get_prayer/model/get_prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/model/prayer_model.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/notification/notification_service.dart';

class GetPrayerViewModel extends Cubit<GetPrayerState> {
  final GetPrayerApi getPrayerApi;
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
        prayers = listPrayer;
        emit(
          GetPrayerSuccessState(listPrayer), // Handle success
        );
      },
    );
  }

  // Periodically check and show the current prayer time
  void startPrayerTimeChecker({
    Duration interval = const Duration(minutes: 1),
  }) {
    _prayerTimeChecker?.cancel();
    _prayerTimeChecker = Stream.periodic(
      interval,
    ).listen((_) => showCurrentPrayersTime());
  }

  void stopPrayerTimeChecker() {
    _prayerTimeChecker?.cancel();
    _prayerTimeChecker = null;
  }

  StreamSubscription? _prayerTimeChecker;

  void showCurrentPrayersTime() {
    try {
      final now = TimeOfDay.now();
      final currentPrayer = prayers.firstWhere((prayer) {
        final prayerTime = TimeOfDay(
          hour: int.parse(prayer.time.split(":")[0]),
          minute: int.parse(prayer.time.split(":")[1]),
        );

        return now.hour == prayerTime.hour && now.minute == prayerTime.minute;
      });
      NotificationService().showNotification(
        id: 1,
        title: "Reminder",
        body: "Perfom your prayer now, it's ${currentPrayer.name} time",
      );
    } catch (e) {}
  }
}
