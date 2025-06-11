import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

PreferredSize taskManagerAppBar(final Size size, final ThemeData theme) {
  final dateFormat = formatDate(DateTime.now(), [dd, ' ', MM, ' ', yyyy]);
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height * 0.03),
    child: Container(
      alignment: Alignment.centerLeft,
      color: theme.appBarTheme.shadowColor,
      padding: EdgeInsets.only(
        left: size.width * 0.045,
        bottom: size.height * 0.01,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: size.width * 0.01,
        children: [
          Text(
            'Manage your tasks efficiently',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontSize: size.width * 0.035,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            '$dateFormat',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface,
              fontSize: size.width * 0.03,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}
