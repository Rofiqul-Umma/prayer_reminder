import 'package:get_it/get_it.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/core/easy_loading_config.dart';
import 'package:prayer_reminder/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:prayer_reminder/features/finance/service/finance_service.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_prayer/api/get_prayer_api.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/settings/service/settings_service.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';
import 'package:prayer_reminder/features/task_manager/service/task_manager_service.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

final getIt = GetIt.instance;

class GetItConfig {
  static Future<void> init() async {
    // Register DioHelper
    getIt.registerLazySingleton<DioHelper>(() => DioHelper());

    // Register GetPrayerApi
    getIt.registerLazySingleton<GetPrayerApi>(() => GetPrayerApi());

    // Register GetPrayerViewModel
    getIt.registerSingleton<GetPrayerViewModel>(
      GetPrayerViewModel(getIt.get<GetPrayerApi>()),
    );
    // Register GetCurrentLocationViewModel
    getIt.registerSingleton<GetCurrentLocationViewModel>(
      GetCurrentLocationViewModel(),
    );

    // Register bottom nav bar view model
    getIt.registerSingleton<BottomNavViewModel>(BottomNavViewModel());

    // register task manager service
    getIt.registerLazySingleton<HiveConfig>(() => HiveConfig());

    getIt.registerLazySingleton<TaskManagerService>(
      () => TaskManagerService(getIt.get<HiveConfig>()),
    );

    // register task manager view model
    getIt.registerSingleton<TaskManagerViewModel>(
      TaskManagerViewModel(getIt<TaskManagerService>()),
    );
    getIt.registerLazySingleton<SettingsService>(
      () => SettingsService(getIt.get<HiveConfig>()),
    );
    // register settings view model
    getIt.registerSingleton<SettingsViewModel>(
      SettingsViewModel(getIt<SettingsService>()),
    );

    getIt.registerLazySingleton<FinanceService>(
      () => FinanceService(getIt.get<HiveConfig>()),
    );

    getIt.registerSingleton<FinanceViewModel>(
      FinanceViewModel(getIt<FinanceService>()),
    );
  }
}
