import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/home/view/home_page.dart';
import 'package:prayer_reminder/features/settings/view/settings_page.dart';
import 'package:prayer_reminder/features/task_manager/view/task_manager_page.dart';

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedCalendar02),
    label: 'Prayer Time',
  ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedFlow),
    label: 'Task Manager',
  ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedSettings02),
    label: 'Settings',
  ),
];

List<Widget> screens = [HomePage(), TaskManagerPage(), SettingsPage()];
