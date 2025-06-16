// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      taskTitle: json['taskTitle'] as String,
      taskDesc: json['taskDesc'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      isCancelled: json['isCancelled'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskTitle': instance.taskTitle,
      'taskDesc': instance.taskDesc,
      'dueDate': instance.dueDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'isCancelled': instance.isCancelled,
      'isDeleted': instance.isDeleted,
    };
