import 'package:prayer_reminder/core/hive_config.dart';

class SettingsService {
  final HiveConfig _hiveConfig;
  SettingsService(this._hiveConfig);

  final String _boxName = 'rubick_settings';

  Future<void> init() async {
    await _hiveConfig.init(_boxName);
  }

  Future<void> saveTheme(String key, bool value) async {
    await _hiveConfig.saveBool(key, value, _boxName);
  }

  Future<bool?> getTheme(String key) async {
    return await _hiveConfig.getBool(key, _boxName);
  }
}
