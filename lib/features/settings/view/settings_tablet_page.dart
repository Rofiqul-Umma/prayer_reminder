import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/constant/rubick_string.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';

class SettingsTabletPage extends StatelessWidget {
  const SettingsTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<SettingsViewModel, bool>(
        bloc: getIt<SettingsViewModel>(),
        listener: (context, state) {
          if (state) {
            EasyLoading.showToast(
              RubickString.successChangeThemeDark,
              duration: const Duration(seconds: 2),
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          } else {
            EasyLoading.showToast(
              duration: const Duration(seconds: 2),
              RubickString.successChangeThemeLight,
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          }
        },
        child: BlocBuilder<SettingsViewModel, bool>(
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
                    width: size.width * 0.25,
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
      ),
    );
  }
}
