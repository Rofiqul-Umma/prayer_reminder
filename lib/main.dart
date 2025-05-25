import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/core/easy_loading_config.dart';
import 'package:prayer_reminder/features/bottom_nav/view/bottom_nav.dart';
import 'package:prayer_reminder/features/notification/service/notification_service.dart';
import 'package:prayer_reminder/features/task_manager/service/task_manager_service.dart';
import 'package:prayer_reminder/themes/dark_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize notification
  await NotificationService().init();
  // intitialize get it
  await setup();
  // initialize dio
  DioHelper.init();
  // initialize hive
  await TaskManagerService().init();
  //iiitalize easy loading
  EasyLoadingConfig.init;
  // initialize the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Reminder',
      themeMode: ThemeMode.dark,
      darkTheme: DarkModeTheme.theme,
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
      builder: EasyLoading.init(),
    );
  }
}
