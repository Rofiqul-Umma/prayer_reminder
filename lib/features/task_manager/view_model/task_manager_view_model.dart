import 'dart:isolate';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';
import 'package:prayer_reminder/features/task_manager/service/task_manager_service.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';

class TaskManagerViewModel extends Cubit<TaskManagerState> {
  final TaskManagerService _service;
  TaskManagerViewModel(this._service) : super(TaskManagerInitialState()) {
    init();
  }

  Future<void> init() async {
    await _service.init();
    await getTasks();
  }

  @override
  void onChange(Change<TaskManagerState> change) {
    super.onChange(change);
    debugPrint('TaskManagerViewModel state changed: ${change.currentState}');
  }

  List<TaskModel> _completedTask = [];

  List<TaskModel> _cancelledTask = [];

  List<TaskModel> _allTask = [];

  List<TaskModel> _todos = [];

  List<TaskModel> get todos => _todos;

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

  Future<void> getTasks() async {
    try {
      emit(TaskManagerLoadingState());
      final tasks = await _service.getTasks();
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

      _todos = todos;

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
      await _service.addTask(task);
      emit(TaskManagaerTaskAddedState(task));
    } catch (e) {
      emit(TaskManagerErrorAddTaskState('$e'));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      emit(TaskManagerLoadingState());
      await _service.deleteTask(id);
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
      await _service.updateTask(id, task);
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
      await _service.updateTask(id, updatedTask);
      emit(TaskManagerTaskCompleted());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    }
  }

  Future<void> cancelTask(String id, TaskModel task) async {
    try {
      emit(TaskManagerLoadingState());
      final updatedTask = task.copyWith(isCancelled: true);
      await _service.updateTask(id, updatedTask);
      emit(TaskManagerTaskCancelled());
    } catch (e) {
      emit(TaskManagerErrorState('$e'));
    }
  }
}
