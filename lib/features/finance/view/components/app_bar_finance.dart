import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/finance/view/components/alert_add_expanses.dart';

AppBar appBarFinance(BuildContext context) {
  final theme = Theme.of(context);
  final size = MediaQuery.sizeOf(context);
  return AppBar(
    centerTitle: false,
    backgroundColor: theme.appBarTheme.backgroundColor,
    title: Text(
      'Finance',
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
          'Record your expenses',
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: size.width * 0.035,
            color: theme.appBarTheme.titleTextStyle?.color,
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
        icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(HugeIcons.strokeRoundedTransactionHistory),
      ),
    ],
  );
}
