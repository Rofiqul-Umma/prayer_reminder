import 'package:flutter/material.dart';

AppBar appBarHadiths(BuildContext context, Size size, ThemeData theme) {
  return AppBar(
    backgroundColor: theme.appBarTheme.backgroundColor,
    title: Text(
      'Hadiths',
      style: theme.textTheme.headlineMedium?.copyWith(
        color: theme.appBarTheme.titleTextStyle?.color,
        fontSize: size.width * 0.06,
        fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.01),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: size.width * 0.045,
          bottom: size.height * 0.01,
        ),
        color: theme.appBarTheme.backgroundColor,
        child: Text(
          'Collection of Hadiths from HR. Bukhari and Muslim',
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: size.width * 0.035,
            color: theme.appBarTheme.titleTextStyle?.color,
          ),
        ),
      ),
    ),
    centerTitle: false,
  );
}
