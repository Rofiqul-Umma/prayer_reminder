import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/view/components/app_bar_finance.dart';
import 'package:prayer_reminder/features/finance/view/components/finance_header.dart';
import 'package:prayer_reminder/features/finance/view/components/list_transaction.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final descC = TextEditingController();
  final amountC = TextEditingController();

  @override
  void dispose() {
    descC.dispose();
    amountC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return BlocListener<FinanceViewModel, FinanceState>(
      bloc: getIt.get<FinanceViewModel>(),
      listener: (context, state) {
        if (state is AddExpanseLoading) {
          EasyLoading.show(status: 'Adding Expanse...');
        } else if (state is AddExpanseSuccess) {
          getIt<FinanceViewModel>().getFinanceData();
          EasyLoading.dismiss();
          EasyLoading.showToast(
            'Expanse Added Successfully',
            duration: const Duration(seconds: 2),
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is AddExpanseError) {
          EasyLoading.dismiss();
          EasyLoading.showToast(
            state.error,
            duration: const Duration(seconds: 2),
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else {
          EasyLoading.dismiss();
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: appBarFinance(context, descC, amountC),
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FinanceHeader(),
              SizedBox(height: size.height * 0.03),
              Text(
                'Recent Transactions',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: size.width * 0.04,
                  fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ListTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
