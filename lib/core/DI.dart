import 'package:get_it/get_it.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_prayer/api/get_prayer_api.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Register context

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

  // Register bottom nav bar view model
  getIt.registerFactory<BottomNavViewModel>(() => BottomNavViewModel());

  // register task manager service
  getIt.registerLazySingleton<HiveConfig>(() => HiveConfig());

  // register task manager view model
  getIt.registerFactory<TaskManagerViewModel>(
    () => TaskManagerViewModel(getIt.get<HiveConfig>()),
  );

  // register settings view model
  getIt.registerFactory<SettingsViewModel>(
    () => SettingsViewModel(getIt.get<HiveConfig>()),
  );
}
