import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:prayer_reminder/features/encryption/service/encryption_service.dart';

class HiveConfig {
  final EncryptionService _service;
  HiveConfig(this._service);

  Future<void> init(String boxName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = p.join(directory.path, 'hive');
    Hive.init(path);
    await Hive.openBox(boxName);
  }

  Future<void> saveData(dynamic data, String boxName) async {
    final box = await Hive.box(boxName);
    final task = await json.encode(data.toJson());
    final encryptedData = _service.encrypter.encrypt(task, iv: _service.iv);
    await box.put(data.id, encryptedData.base64); // Use task ID as key
  }

  Future<List<Map<String, dynamic>>> getData(String boxName) async {
    final box = await Hive.box(boxName);
    final tasks = box.values;
    return tasks.map((item) {
      final decryptedData = _service.encrypter.decrypt64(item, iv: _service.iv);
      return json.decode(decryptedData) as Map<String, dynamic>;
    }).toList();
  }

  Future<void> deleteTask(String id, String boxName) async {
    final box = await Hive.box(boxName);
    await box.delete(id); // Delete by ID
  }

  Future<void> updateData(String id, dynamic data, String boxName) async {
    final box = await Hive.box(boxName);
    final taskJson = await json.encode(data.toJson());
    final encryptedData = _service.encrypter.encrypt(taskJson, iv: _service.iv);
    await box.put(id, encryptedData.base64); // Update by ID
  }

  Future<void> saveBool(String key, bool value, String boxName) async {
    final box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  Future<bool?> getBool(String key, String boxName) async {
    final box = await Hive.openBox(boxName);
    final value = box.get(key) as bool;
    return value;
  }
}
