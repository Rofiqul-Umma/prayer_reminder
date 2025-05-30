import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_reminder/features/finance/model/expanses_category_model.dart';
import 'package:prayer_reminder/features/finance/model/expanses_model.dart';

class CardTransaction extends StatelessWidget {
  final int index;
  final ExpansesModel data;
  const CardTransaction({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: ListTile(
        leading: Icon(
          expansesData
              .firstWhere((element) => element.name == data.category)
              .icon,
          size: size.width * 0.08,
          color: theme.colorScheme.onSurface,
        ),
        title: Text(
          data.category,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          data.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Text(
          NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp',
            decimalDigits: 0,
          ).format(
            data.amount, // Example amount
          ),
        ),
      ),
    );
  }
}
