import 'package:equatable/equatable.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';

sealed class TaskManagerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskManagerInitialState extends TaskManagerState {}

class TaskManagerLoadingState extends TaskManagerState {}

class TaskManagerSuccessState extends TaskManagerState {
  final List<TaskModel> data;
  TaskManagerSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class TaskManagerSuccessDeleteState extends TaskManagerState {}

class taskManagerEmptyState extends TaskManagerState {}

class TaskManagerErrorState extends TaskManagerState {
  final String error;
  TaskManagerErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class TaskManagaerTaskAddedState extends TaskManagerState {
  final TaskModel data;
  TaskManagaerTaskAddedState(this.data);

  @override
  List<Object?> get props => [data];
}

class TaskManagerLoadingAddTaskState extends TaskManagerState {}

class TaskManagerErrorAddTaskState extends TaskManagerState {
  final String error;
  TaskManagerErrorAddTaskState(this.error);

  @override
  List<Object?> get props => [error];
}

class TaskManagerTaskUpdated extends TaskManagerState {}

class TaskManagerTaskCompleted extends TaskManagerState {}

class TaskManagerTaskCancelled extends TaskManagerState {}

class TaskManagerErrorAddTask extends TaskManagerState {
  final String error;
  TaskManagerErrorAddTask(this.error);

  @override
  List<Object?> get props => [error];
}
