import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/themes/dark_mode.dart';

import 'features/home/view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // intitialize get it
  setup();
  // initialize dio
  DioHelper.init();
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
      home: HomePage(),
    );
  }
}
