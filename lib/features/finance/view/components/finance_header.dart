import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';

class FinanceHeader extends StatelessWidget {
  const FinanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<FinanceViewModel, FinanceState>(
      bloc: getIt.get<FinanceViewModel>(),
      builder: (context, state) {
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(size.width * 0.02),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Total',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ' Expenses',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(
                    getIt.get<FinanceViewModel>().totalExpanses,
                  ), // Example amount
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: size.width * 0.09,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  spacing: size.width * 0.02,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      HugeIcons.strokeRoundedCalendar01,
                      size: size.width * 0.05,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      DateFormat.yMMMM().format(DateTime.now()),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
