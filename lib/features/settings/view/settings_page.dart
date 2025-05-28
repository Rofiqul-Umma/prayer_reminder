import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Theme Mode',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.appBarTheme.titleTextStyle?.color,
            fontSize: size.width * 0.06,
            fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.01),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: size.width * 0.045,
              bottom: size.height * 0.01,
            ),
            color: theme.appBarTheme.backgroundColor,
            child: Text(
              'Change the theme mode of the app',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: size.width * 0.035,
                color: theme.appBarTheme.titleTextStyle?.color,
              ),
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<SettingsViewModel, bool>(
        bloc: getIt<SettingsViewModel>(),
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  state
                      ? 'assets/images/moon_anim.json'
                      : 'assets/images/sun_anim.json',
                  width: size.width * 0.5,
                  fit: BoxFit.fill,
                ),

                SizedBox(height: size.height * 0.02),
                CupertinoSwitch(
                  value: getIt<SettingsViewModel>().state,
                  thumbIcon: WidgetStateProperty.all(
                    state
                        ? const Icon(HugeIcons.strokeRoundedMoon02)
                        : const Icon(HugeIcons.strokeRoundedSun02),
                  ),
                  applyTheme: true,
                  onChanged:
                      (value) async =>
                          await getIt<SettingsViewModel>().toggleTheme(value),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
