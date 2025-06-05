import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/view/components/card_transaction.dart';
import 'package:prayer_reminder/features/finance/view/components/empty_transaction.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';

class ListTransaction extends StatelessWidget {
  const ListTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewModel = getIt<FinanceViewModel>();
    return BlocBuilder<FinanceViewModel, FinanceState>(
      bloc: getIt.get<FinanceViewModel>(),
      builder: (context, state) {
        if (state is GetExpansesLoading) {
          return Loading();
        } else if (state is GetExpansesEmpty) {
          return EmptyTransaction();
        } else if (state is GetExpansesSuccess) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: size.height * 0.01);
              },
              itemCount: state.expanses.length, // Example item count
              itemBuilder: (context, index) {
                return CardTransaction(
                  index: index,
                  data: state.expanses[index],
                );
              },
            ),
          );
        } else if (state is GetExpansesError) {
          return Text(
            state.error,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.error,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: size.height * 0.01);
              },
              itemCount: viewModel.expanses.length, // Example item count
              itemBuilder: (context, index) {
                return CardTransaction(
                  index: index,
                  data: viewModel.expanses[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
