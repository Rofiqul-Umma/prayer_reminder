import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';
import 'package:path/path.dart' as p;

class TaskManagerService {
  static const String _boxName = 'tasks';

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = p.join(directory.path, 'hive');
    Hive.init(path);
    await Hive.openBox(_boxName);
  }

  Future<void> saveTask(TaskModel data) async {
    final box = await Hive.box(_boxName);
    final task = await json.encode(data.toJson());
    await box.put(data.id, task); // Use task ID as key
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final box = await Hive.box(_boxName);
    final tasks = box.values;
    // Each item is a JSON string, decode each one
    return tasks
        .map((item) => json.decode(item) as Map<String, dynamic>)
        .toList();
  }

  Future<void> deleteTask(String id) async {
    final box = await Hive.box(_boxName);
    await box.delete(id); // Delete by ID
  }

  Future<void> updateTask(String id, TaskModel task) async {
    final box = await Hive.box(_boxName);
    final taskJson = await json.encode(task.toJson());
    await box.put(id, taskJson); // Update by ID
  }
}
