import 'dart:isolate';

import 'package:prayer_reminder/core/hive_config.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';

class TaskManagerService {
  final HiveConfig _hiveConfig;
  TaskManagerService(this._hiveConfig);

  final String _boxName = 'rubick_task_manager';

  Future<void> init() async {
    await _hiveConfig.init(_boxName);
  }

  Future<void> addTask(TaskModel data) async {
    await _hiveConfig.saveTask(data, _boxName);
  }

  Future<List<TaskModel>> getTasks() async {
    final tasks = await _hiveConfig.getTasks(_boxName);
    final cTasks = await Isolate.run(
      () =>
          tasks.map((task) {
            final cTask = TaskModel.fromJson(task);
            return cTask;
          }).toList(),
    );
    return cTasks;
  }

  Future<void> deleteTask(String id) async {
    await _hiveConfig.deleteTask(id, _boxName);
  }

  Future<void> updateTask(String id, TaskModel data) async {
    await _hiveConfig.updateTask(id, data, _boxName);
  }
}
