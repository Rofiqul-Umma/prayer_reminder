import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';

part 'task_manager_state.freezed.dart';

@freezed
class TaskManagerState with _$TaskManagerState {
  const factory TaskManagerState.initial() = TaskManagerInitialState;
  const factory TaskManagerState.loading() = TaskManagerLoadingState;
  const factory TaskManagerState.success(List<TaskModel> data) =
      TaskManagerSuccessState;
  const factory TaskManagerState.successDelete() =
      TaskManagerSuccessDeleteState;
  const factory TaskManagerState.empty() = TaskManagerEmptyState;
  const factory TaskManagerState.error(String error) = TaskManagerErrorState;
  const factory TaskManagerState.taskAdded(TaskModel data) =
      TaskManagerTaskAddedState;
  const factory TaskManagerState.loadingAddTask() =
      TaskManagerLoadingAddTaskState;
  const factory TaskManagerState.errorAddTask(String error) =
      TaskManagerErrorAddTaskState;
  const factory TaskManagerState.taskUpdated() = TaskManagerTaskUpdated;
  const factory TaskManagerState.taskCompleted() = TaskManagerTaskCompleted;
  const factory TaskManagerState.taskCancelled() = TaskManagerTaskCancelled;
  const factory TaskManagerState.loadingUpdateTask() =
      TaskManagerLoadingUpdateTaskState;
  const factory TaskManagerState.loadingCompleteTask() =
      TaskManagerLoadingCompleteTaskState;
  const factory TaskManagerState.loadingCancelTask() =
      TaskManagerLoadingCancelTaskState;
  const factory TaskManagerState.loadingDeleteTask() =
      TaskManagerLoadingDeleteTaskState;
}
