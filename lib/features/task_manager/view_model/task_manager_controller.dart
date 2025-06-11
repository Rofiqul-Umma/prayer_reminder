import 'package:flutter/material.dart';

class TaskManagerController with ChangeNotifier {
  final taskTitleC = TextEditingController();
  final taskDescC = TextEditingController();
  final taskTimeC = TextEditingController();

  @override
  void dispose() {
    taskDescC.dispose();
    taskTitleC.dispose();
    taskTimeC.dispose();
    super.dispose();
  }

  void clearFields() {
    taskDescC.clear();
    taskTitleC.clear();
    taskTimeC.clear();
  }
}
