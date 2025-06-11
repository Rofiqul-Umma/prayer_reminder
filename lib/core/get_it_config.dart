import 'package:get_it/get_it.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:prayer_reminder/features/date_time_picker/view_model/date_time_picker_VM.dart';
import 'package:prayer_reminder/features/encryption/service/encryption_service.dart';
import 'package:prayer_reminder/features/finance/service/finance_service.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_controller.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_hadits/service/get_hadits_service.dart';
import 'package:prayer_reminder/features/get_hadits/view_model/get_hadits_view_model.dart';
import 'package:prayer_reminder/features/get_prayer/service/get_prayer_service.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/settings/service/settings_service.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';
import 'package:prayer_reminder/features/task_manager/service/task_manager_service.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_controller.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

final getIt = GetIt.instance;

class GetItConfig {
  static Future<void> init() async {
    // Register Encryptor
    getIt.registerLazySingleton(() => EncryptionService());
    // Register DioHelper
    getIt.registerLazySingleton<DioHelper>(() => DioHelper());

    // Register GetPrayerApi
    getIt.registerLazySingleton<GetPrayerService>(() => GetPrayerService());

    // Register GetPrayerViewModel
    getIt.registerSingleton<GetPrayerViewModel>(
      GetPrayerViewModel(getIt.get<GetPrayerService>()),
    );
    // Register GetCurrentLocationViewModel
    getIt.registerSingleton<GetCurrentLocationViewModel>(
      GetCurrentLocationViewModel(),
    );

    // Register bottom nav bar view model
    getIt.registerSingleton<BottomNavViewModel>(BottomNavViewModel());

    // register task manager service
    getIt.registerLazySingleton<HiveConfig>(
      () => HiveConfig(getIt.get<EncryptionService>()),
    );

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

    getIt.registerSingleton<DateTimePickerVM>(DateTimePickerVM());

    getIt.registerLazySingleton<GetHaditsService>(() => GetHaditsService());

    getIt.registerSingleton<GetHaditsViewModel>(
      GetHaditsViewModel(getIt<GetHaditsService>()),
    );

    getIt.registerSingleton<TaskManagerController>(TaskManagerController());

    getIt.registerSingleton<FinanceController>(FinanceController());
  }
}
