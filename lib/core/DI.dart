import 'package:get_it/get_it.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_prayer/api/get_prayer_api.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';

final getIt = GetIt.instance;

void setup() {
  // Register DioHelper
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  // Register GetPrayerApi
  getIt.registerLazySingleton<GetPrayerApi>(() => GetPrayerApi());

  // Register GetPrayerViewModel
  getIt.registerFactory<GetPrayerViewModel>(
    () => GetPrayerViewModel(getIt.get<GetPrayerApi>()),
  );

  // Register GetCurrentLocationViewModel
  getIt.registerFactory<GetCurrentLocationViewModel>(
    () => GetCurrentLocationViewModel(),
  );
}
