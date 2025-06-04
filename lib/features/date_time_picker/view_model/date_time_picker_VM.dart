import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DateTimePickerVM extends Cubit<DateTime> {
  DateTimePickerVM() : super(DateTime.now());

  TimeOfDay _initialTime = TimeOfDay.now();
  TimeOfDay get initialTime => _initialTime;

  void setDateTime(TimeOfDay currentTime) {
    final dueDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      currentTime.hour,
      currentTime.minute,
    );
    _initialTime = TimeOfDay(
      hour: currentTime.hour,
      minute: currentTime.minute,
    );
    emit(dueDate);
  }

  void resetDateTime() {
    emit(DateTime.now());
  }
}
