import 'package:prayer_reminder/features/get_prayer/model/prayer_model.dart';

sealed class GetPrayerState {}

class GetPrayerInitialState extends GetPrayerState {}

class GetPrayerLoadingState extends GetPrayerState {}

class GetPrayerSuccessState extends GetPrayerState {
  final PrayerModel data;
  GetPrayerSuccessState(this.data);
}

class GetPrayerErrorState extends GetPrayerState {
  final String error;
  GetPrayerErrorState(this.error);
}
