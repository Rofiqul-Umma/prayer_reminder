import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';
import 'package:prayer_reminder/features/task_manager/service/task_manager_service.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';

class TaskManagerViewModel extends Cubit<TaskManagerState> {
  final TaskManagerService _taskService;
  TaskManagerViewModel(this._taskService) : super(TaskManagerInitialState());

  @override
  void onChange(Change<TaskManagerState> change) {
    super.onChange(change);
    debugPrint('TaskManagerViewModel state changed: ${change.currentState}');
  }

  List<TaskModel> _completedTask = [];

  List<TaskModel> _cancelledTask = [];

  List<TaskModel> _allTask = [];

  List<TaskModel> get allTasks => _allTask;

  List<TaskModel> get completedTask => _completedTask;

  List<TaskModel> get cancelledTask => _cancelledTask;

  Future<void> setCompleteTask(List<TaskModel> value) async {
    _completedTask = await Isolate.run(
      () => value.where((value) => value.isCompleted).toList(),
    );
    debugPrint('completedTask: ${_completedTask.length}');
  }

  Future<void> setCancelledTask(List<TaskModel> value) async {
    _cancelledTask = await Isolate.run(
      () => value.where((value) => value.isCancelled).toList(),
    );
    debugPrint('cancelledTask: ${_cancelledTask.length}');
  }

  Future<void> init() async {
    Future.wait([_taskService.init(), getTasks()]);
  }

  Future<List<TaskModel>> _getAllTasks() async {
    try {
      final tasks = await _taskService.getTasks();
      final cTask = await Isolate.run(
        () =>
            tasks.map((task) {
              final cTask = TaskModel.fromJson(task);
              return cTask;
            }).toList(),
      );

      return cTask;
    } catch (e) {
      return [];
    }
  }

  Future<void> getTasks() async {
    try {
      emit(TaskManagerLoadingState());
      final tasks = await _getAllTasks();
      if (tasks.isEmpty) {
        emit(taskManagerEmptyState());
        return;
      }

      await setCompleteTask(tasks);

      await setCancelledTask(tasks);

      _allTask = tasks;

      final todos =
          tasks
              .where((task) => !task.isCompleted && !task.isCancelled)
              .toList();

      if (todos.isEmpty) {
        emit(taskManagerEmptyState());
        return;
      }
      emit(TaskManagerSuccessState(todos));
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    }
  }

  Future<void> addTask(String taskTitle, String taskDesc) async {
    try {
      emit(TaskManagerLoadingAddTaskState());
      if (taskTitle.trim().isEmpty || taskDesc.trim().isEmpty) {
        emit(
          TaskManagerErrorAddTaskState(
            'Task title and description cannot be empty',
          ),
        );
        return;
      }
      final task = TaskModel(taskTitle: taskTitle, taskDesc: taskDesc);
      await _taskService.saveTask(task);
      emit(TaskManagaerTaskAddedState(task));
    } catch (e) {
      emit(TaskManagerErrorAddTaskState('$e'));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      emit(TaskManagerLoadingState());
      await _taskService.deleteTask(id);
      emit(TaskManagerSuccessDeleteState());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    } finally {
      getTasks();
    }
  }

  Future<void> updateTask(String id, TaskModel task) async {
    try {
      emit(TaskManagerLoadingState());
      if (task.taskTitle.trim().isEmpty || task.taskDesc.trim().isEmpty) {
        emit(
          TaskManagerErrorAddTaskState(
            'Task title and description cannot be empty',
          ),
        );
        return;
      }
      await _taskService.updateTask(id, task);
      emit(TaskManagerTaskUpdated());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    } finally {
      getTasks();
    }
  }

  Future<void> completeTask(String id, TaskModel task) async {
    try {
      emit(TaskManagerLoadingState());
      final updatedTask = task.copyWith(isCompleted: true);
      await _taskService.updateTask(id, updatedTask);
      emit(TaskManagerTaskCompleted());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    }
  }

  Future<void> cancelTask(String id, TaskModel task) async {
    try {
      emit(TaskManagerLoadingState());
      final updatedTask = task.copyWith(isCancelled: true);
      await _taskService.updateTask(id, updatedTask);
      emit(TaskManagerTaskCancelled());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    }
  }
}
