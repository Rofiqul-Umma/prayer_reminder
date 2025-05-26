import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/hive_config.dart';

class SettingsViewModel extends Cubit<bool> {
  final HiveConfig _hiveConfig;
  SettingsViewModel(this._hiveConfig) : super(false) {
    _init();
  }

  bool _currentTheme = false;
  bool get currentTheme => _currentTheme;

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
    await _hiveConfig.init();
    await loadTheme();
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      emit(isDarkMode);
      debugPrint('Toggling theme to: $isDarkMode');
      await _hiveConfig.saveBool('1', isDarkMode);
    } catch (e) {
      debugPrint('Error toggling theme: $e');
    } finally {
      loadTheme();
    }
  }

  Future<void> loadTheme() async {
    try {
      final isDarkMode = await _hiveConfig.getBool('1');
      debugPrint('Loaded theme preference: $isDarkMode');
      if (isDarkMode == null) {
        debugPrint('No theme preference found, defaulting to light mode.');
        return;
      }
      _currentTheme = isDarkMode;
      debugPrint('Current theme set to: $_currentTheme');
      emit(isDarkMode);
    } catch (e) {
      debugPrint('Error loading theme: $e');
    }
  }
}
