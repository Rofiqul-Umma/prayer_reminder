import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/model/dropdown_model.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';

class TransactionHistoryChart extends StatelessWidget {
  const TransactionHistoryChart({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<FinanceViewModel>();
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 10000000, // Set max to 10 million Rupiah
            minY: 0,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${months[group.x]}: Rp${rod.toY.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    final month = months[value.toInt()];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        month.substring(0, 3),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontSize: size.width * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                  reservedSize: 32,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2000000, // 2 million interval for better scaling
                  getTitlesWidget: (double value, TitleMeta meta) {
                    // Format as "Rp2jt", "Rp4jt", etc.
                    return Text(
                      'Rp${(value ~/ 1000000)}jt',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: size.width * 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                  reservedSize: 48,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 2000000, // 2 million interval
              getDrawingHorizontalLine:
                  (value) => FlLine(
                    color: theme.dividerColor.withAlpha(20),
                    strokeWidth: 1,
                  ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: List.generate(viewModel.monthlyTotals.length, (index) {
              final isCurrentMonth = index == DateTime.now().month - 1;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: viewModel.monthlyTotals[index].toDouble(),
                    borderRadius: BorderRadius.circular(8),
                    width: 8,
                    color:
                        isCurrentMonth
                            ? theme.colorScheme.primary
                            : theme.colorScheme.primary.withAlpha(70),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 10000000,
                      color: theme.colorScheme.primary.withAlpha(8),
                    ),
                  ),
                ],
              );
            }),
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
        ),
      ),
    );
  }
}
