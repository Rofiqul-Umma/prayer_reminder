import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/custom_app_bar_back.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/utilities/view_model/utilities_view_model.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: customAppBarBack("Theme Settings", context),
      body: BlocBuilder<UtilitiesViewModel, bool>(
        bloc: getIt<UtilitiesViewModel>(),
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
                  value: getIt<UtilitiesViewModel>().state,
                  thumbIcon: WidgetStateProperty.all(
                    state
                        ? const Icon(HugeIcons.strokeRoundedMoon02)
                        : const Icon(HugeIcons.strokeRoundedSun02),
                  ),
                  applyTheme: true,
                  onChanged:
                      (value) async =>
                          await getIt<UtilitiesViewModel>().toggleTheme(value),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
