import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/core/easy_loading_config.dart';
import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/bottom_nav/view/bottom_nav.dart';
import 'package:prayer_reminder/features/notification/service/notification_service.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';
import 'package:prayer_reminder/themes/dark_mode.dart';
import 'package:prayer_reminder/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize notification
  await NotificationService().init();
  // intitialize get it
  await setup();
  // initialize dio
  DioHelper.init();
  //iiitalize easy loading
  EasyLoadingConfig.init;
  // initialize hive
  await HiveConfig().init();
  // initialize the app
  runApp(
    BlocProvider.value(value: getIt.get<SettingsViewModel>(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Reminder',
      themeMode:
          getIt.get<SettingsViewModel>().currentTheme
              ? ThemeMode.dark
              : ThemeMode.light,
      darkTheme: DarkModeTheme.theme,
      theme: LightModeTheme.theme,
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
      builder: EasyLoading.init(),
    );
  }
}
