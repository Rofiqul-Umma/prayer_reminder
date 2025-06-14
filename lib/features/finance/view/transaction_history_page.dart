import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/custom_app_bar_back.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/model/expanses_model.dart';
import 'package:prayer_reminder/features/finance/view/components/card_transaction.dart';
import 'package:prayer_reminder/features/finance/view/components/drop_down_selector.dart';
import 'package:prayer_reminder/features/finance/view/components/transaction_history_chart.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final viewModel = getIt<FinanceViewModel>();
    return Scaffold(
      appBar: customAppBarBack('Transaction History', context, [
        IconButton(
          onPressed: () async {
            await viewModel.getFinanceDataByMonthAndYear(
              viewModel.selectedMonth,
              viewModel.selectedYear,
            );
          },
          icon: Icon(HugeIcons.strokeRoundedReload),
        ),
      ]),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionHistoryChart(),
            SizedBox(height: size.height * 0.02),
            DropDownSelector(),
            SizedBox(height: size.height * 0.02),
            Text(
              'Transactions',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: size.width * 0.04,
                fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            BlocBuilder<FinanceViewModel, FinanceState>(
              bloc: getIt.get<FinanceViewModel>(),
              builder: (context, state) {
                if (state is FilterExpansesByMonthYearLoading) {
                  return Loading();
                } else if (state is FilterExpansesByMonthYearError) {
                  return Text(
                    state.error,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.error,
                    ),
                  );
                } else if (state is FilterExpansesByMonthYearSuccess) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: size.height * 0.01);
                      },
                      itemCount:
                          state.filteredExpanses.length, // Example item count
                      itemBuilder: (context, index) {
                        return CardTransaction(
                          index: index,
                          data: ExpansesModel(
                            category: state.filteredExpanses[index].category,
                            description:
                                state.filteredExpanses[index].description,
                            amount: state.filteredExpanses[index].amount,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(child: Text('No transactions found')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
