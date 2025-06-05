import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/dio_helper.dart';
import 'package:prayer_reminder/core/easy_loading_config.dart';
import 'package:prayer_reminder/features/bottom_nav/view/bottom_nav.dart';
import 'package:prayer_reminder/features/notification/service/notification_service.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';
import 'package:prayer_reminder/features/side_bar_menu/view/side_bar_menu.dart';
import 'package:prayer_reminder/themes/dark_mode.dart';
import 'package:prayer_reminder/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize notification
  await NotificationService().init();
  // intitialize get it
  await GetItConfig.init();
  //iiitalize easy loading
  await EasyLoadingConfig.init();
  // initialize dio
  DioHelper.init();
  // initialize the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<SettingsViewModel, bool>(
      bloc: getIt<SettingsViewModel>(),
      builder: (context, state) {
        return MaterialApp(
          title: 'Rubick',
          builder: EasyLoading.init(),
          themeMode:
              getIt<SettingsViewModel>().state
                  ? ThemeMode.dark
                  : ThemeMode.light,
          darkTheme: DarkModeTheme.theme,
          theme: LightModeTheme.theme,
          debugShowCheckedModeBanner: false,
          home: size.width > 600 ? SiderBarMenu() : BottomNavBar(),
        );
      },
    );
  }
}
