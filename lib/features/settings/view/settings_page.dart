import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/settings/view_model/settings_view_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsViewModel _settingsViewModel;

  @override
  void initState() {
    _settingsViewModel = getIt.get<SettingsViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Settings'), centerTitle: false),
      body: BlocBuilder<SettingsViewModel, bool>(
        bloc: _settingsViewModel,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state == ThemeMode.dark
                      ? HugeIcons.strokeRoundedSun02
                      : HugeIcons.strokeRoundedMoon02,
                  size: size.aspectRatio * 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: size.height * 0.02),
                CupertinoSwitch(
                  value: state,
                  applyTheme: true,
                  onChanged: (value) async {
                    await _settingsViewModel.toggleTheme(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
