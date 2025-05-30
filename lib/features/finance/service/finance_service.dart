import 'dart:isolate';

import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/finance/model/expanses_model.dart';

class FinanceService {
  final HiveConfig _hiveConfig;
  FinanceService(this._hiveConfig);
  final String _boxName = 'rubick_finance';

  Future<void> init() async {
    await _hiveConfig.init(_boxName);
  }

  Future<void> saveFinanceData(ExpansesModel data) async {
    await _hiveConfig.saveData(data, _boxName);
  }

  Future<List<ExpansesModel>> getFinanceData() async {
    final jsonData = await _hiveConfig.getData(_boxName);
    return await Isolate.run(
      () =>
          jsonData.map((item) {
            return ExpansesModel.fromJson(item);
          }).toList(),
    );
  }

  Future<void> deleteFinanceData(String id) async {
    await _hiveConfig.deleteTask(id, _boxName);
  }

  Future<void> updateFinanceData(String id, ExpansesModel data) async {
    await _hiveConfig.updateData(id, data, _boxName);
  }
}
