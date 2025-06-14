import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

AppBar customAppBarBack(
  String appbarTitle,
  BuildContext context, [
  List<Widget>? actions,
]) {
  final size = MediaQuery.sizeOf(context);
  final theme = Theme.of(context);
  return AppBar(
    backgroundColor: theme.appBarTheme.backgroundColor,
    leading: IconButton(
      icon: const Icon(HugeIcons.strokeRoundedCurvyLeftDirection),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      appbarTitle,
      style: theme.textTheme.headlineMedium?.copyWith(
        color: theme.appBarTheme.titleTextStyle?.color,
        fontSize: size.width * 0.06,
        fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
      ),
    ),
    actions: actions,
  );
}
