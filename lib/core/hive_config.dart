import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class HiveConfig {
  Future<void> init(String boxName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = p.join(directory.path, 'hive');
    Hive.init(path);
    await Hive.openBox(boxName);
  }

  Future<void> saveData(dynamic data, String boxName) async {
    final box = await Hive.box(boxName);
    final task = await json.encode(data.toJson());
    await box.put(data.id, task); // Use task ID as key
  }

  Future<List<Map<String, dynamic>>> getData(String boxName) async {
    final box = await Hive.box(boxName);
    final tasks = box.values;
    // Each item is a JSON string, decode each one
    return tasks
        .map((item) => json.decode(item) as Map<String, dynamic>)
        .toList();
  }

  Future<void> deleteTask(String id, String boxName) async {
    final box = await Hive.box(boxName);
    await box.delete(id); // Delete by ID
  }

  Future<void> updateData(String id, dynamic data, String boxName) async {
    final box = await Hive.box(boxName);
    final taskJson = await json.encode(data.toJson());
    await box.put(id, taskJson); // Update by ID
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
