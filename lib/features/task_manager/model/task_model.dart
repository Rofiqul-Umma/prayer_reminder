class TaskModel {
  String id;
  String taskTitle;
  String taskDesc;
  DateTime dueDate;
  DateTime createdAt;
  bool isCompleted;
  bool isCancelled;
  bool isDeleted;

  TaskModel({
    String? id,
    required this.taskTitle,
    required this.taskDesc,
    required this.dueDate,
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
      'dueDate': dueDate.toIso8601String(),
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
      dueDate: DateTime.parse(json['dueDate']),
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
    DateTime? dueDate,
    bool? isCompleted,
    bool? isCancelled,
    bool? isDeleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      dueDate: dueDate ?? this.dueDate,
      taskDesc: taskDesc ?? this.taskDesc,
      createdAt: createdAt ?? this.createdAt,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancelled: isCancelled ?? this.isCancelled,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
