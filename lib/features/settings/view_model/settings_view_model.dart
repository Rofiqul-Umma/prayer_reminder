import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/hive_config.dart';

class SettingsViewModel extends Cubit<bool> {
  final HiveConfig _hiveConfig;
  SettingsViewModel(this._hiveConfig) : super(false) {
    _init();
  }

  final String _boxName = 'rubick_settings';

  @override
  void onChange(Change<bool> change) {
    debugPrint('SettingsViewModel state changed: ${change.currentState}');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('SettingsViewModel error: $error');
    super.onError(error, stackTrace);
  }

  Future<void> _init() async {
    await _hiveConfig.init(_boxName);
    await loadTheme();
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      await _hiveConfig.saveBool('1', isDarkMode, _boxName);
    } catch (e) {
      debugPrint('Error toggling theme: $e');
    } finally {
      loadTheme();
    }
  }

  Future<void> loadTheme() async {
    try {
      final isDarkMode = await _hiveConfig.getBool('1', _boxName);
      emit(isDarkMode ?? false);
    } catch (e) {
      debugPrint('Error loading theme: $e');
    }
  }
}
