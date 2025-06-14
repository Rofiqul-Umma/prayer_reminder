import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/model/dropdown_model.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_state.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';

class DropDownSelector extends StatelessWidget {
  const DropDownSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final viewModel = getIt<FinanceViewModel>();
    debugPrint(
      'DropDownSelector: ${viewModel.selectedMonth}, ${viewModel.selectedYear}',
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.outline,
          width: size.width * 0.002,
        ),
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: BlocBuilder<FinanceViewModel, FinanceState>(
        bloc: viewModel,
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: viewModel.selectedMonth,
                      items: items,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: size.width * 0.03,
                      ),
                      iconSize: size.width * 0.03,
                      icon: Icon(HugeIcons.strokeRoundedArrowDown04),
                      alignment: AlignmentDirectional.center,
                      onChanged: (value) async {
                        if (value != null) {
                          viewModel.setSelectedMonth(value);
                          await viewModel.getFinanceDataByMonthAndYear(
                            value,
                            viewModel.selectedYear,
                          );
                        }
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return items.map((DropdownMenuItem<String> item) {
                          return Center(child: Text(item.value!));
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: 1, // Thin divider
                height: size.height * 0.05,
                color: theme.colorScheme.outline,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: viewModel.selectedYear,
                      items: years,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: size.width * 0.03,
                      ),
                      iconSize: size.width * 0.03,
                      icon: Icon(HugeIcons.strokeRoundedArrowDown04),
                      alignment: AlignmentDirectional.center,
                      onChanged: (value) async {
                        if (value != null) {
                          viewModel.setSelectedYear(value);
                          await viewModel.getFinanceDataByMonthAndYear(
                            viewModel.selectedMonth,
                            value,
                          );
                        }
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return years.map((DropdownMenuItem<String> item) {
                          return Center(child: Text(item.value!));
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
