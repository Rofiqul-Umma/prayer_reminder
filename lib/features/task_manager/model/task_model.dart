class TaskModel {
  String id;
  String taskTitle;
  String taskDesc;
  DateTime createdAt;
  bool isCompleted;
  bool isCancelled;
  bool isDeleted;

  TaskModel({
    String? id,
    required this.taskTitle,
    required this.taskDesc,
    DateTime? createdAt,
    this.isCompleted = false,
    this.isCancelled = false,
    this.isDeleted = false,
  }) : createdAt = createdAt ?? DateTime.now(),
       id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'taskDesc': taskDesc,
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
      'isCancelled': isCancelled,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      taskTitle: json['taskTitle'],
      taskDesc: json['taskDesc'],
      createdAt: DateTime.parse(json['createdAt']),
      isCompleted: json['isCompleted'] ?? false,
      isCancelled: json['isCancelled'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
    );
  }

  // Method copy with
  TaskModel copyWith({
    String? id,
    String? taskTitle,
    String? taskDesc,
    DateTime? createdAt,
    bool? isCompleted,
    bool? isCancelled,
    bool? isDeleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDesc: taskDesc ?? this.taskDesc,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancelled: isCancelled ?? this.isCancelled,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
