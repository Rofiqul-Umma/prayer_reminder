import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/home/view/home_page.dart';
import 'package:prayer_reminder/features/task_manager/view/task_manager_page.dart';

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedClock01),
    label: 'Prayer Time',
  ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedFlow),
    label: 'Task Manager',
  ),
];

List<Widget> screens = [HomePage(), TaskManagerPage()];
