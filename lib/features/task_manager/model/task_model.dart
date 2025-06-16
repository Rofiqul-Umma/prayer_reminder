import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_model.g.dart';
part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required DateTime createdAt,
    @Default(false) bool isCompleted,
    @Default(false) bool isCancelled,
    @Default(false) bool isDeleted,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
