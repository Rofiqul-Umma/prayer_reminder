import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/finance/view/finance_page.dart';
// import 'package:prayer_reminder/features/hadiths/view/hadiths_page.dart';
import 'package:prayer_reminder/features/prayer_time/view/prayer_time_page.dart';
import 'package:prayer_reminder/features/utilities/view/utilities_page.dart';
import 'package:prayer_reminder/features/task_manager/view/task_manager_page.dart';

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedCalendar02),
    label: 'Prayer Time',
  ),
  // BottomNavigationBarItem(
  //   icon: Icon(HugeIcons.strokeRoundedBook02),
  //   label: 'Hadits',
  // ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedFlow),
    label: 'Task Manager',
  ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedSaveMoneyDollar),
    label: 'Finance',
  ),
  BottomNavigationBarItem(
    icon: Icon(HugeIcons.strokeRoundedSettings05),
    label: 'Utilites',
  ),
];

List<Widget> screens = [
  PrayerTimePage(),
  // HadithsPage(),
  TaskManagerPage(),
  FinancePage(),
  UtilitiesPage(),
];
