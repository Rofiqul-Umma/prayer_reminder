import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/utilities/service/utilites_service.dart';

class UtilitiesViewModel extends Cubit<bool> {
  final UtilitiesService _service;
  UtilitiesViewModel(this._service) : super(false) {
    _init();
  }

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
    await _service.init();
    await loadTheme();
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      await _service.saveTheme('1', isDarkMode);
    } catch (e) {
      debugPrint('Error toggling theme: $e');
    } finally {
      loadTheme();
    }
  }

  Future<void> loadTheme() async {
    try {
      final isDarkMode = await _service.getTheme('1');
      emit(isDarkMode ?? false);
    } catch (e) {
      debugPrint('Error loading theme: $e');
    }
  }
}
