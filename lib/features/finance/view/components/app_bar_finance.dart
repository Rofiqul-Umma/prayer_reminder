import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/finance/view/components/alert_add_expanses.dart';

AppBar appBarFinance(BuildContext context) {
  final theme = Theme.of(context);
  final size = MediaQuery.sizeOf(context);
  return AppBar(
    centerTitle: false,
    backgroundColor: theme.scaffoldBackgroundColor,
    title: Text(
      'Finance',
      style: theme.textTheme.headlineMedium?.copyWith(
        color: theme.colorScheme.onSurface,
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
        color: theme.scaffoldBackgroundColor,
        child: Text(
          'Record your expenses',
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: size.width * 0.035,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (_) => AlertAddExpanses(),
          );
        },
        icon: Icon(
          HugeIcons.strokeRoundedAddCircle,
          color: theme.colorScheme.onSurface,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          HugeIcons.strokeRoundedTransactionHistory,
          color: theme.colorScheme.onSurface,
        ),
      ),
    ],
  );
}
