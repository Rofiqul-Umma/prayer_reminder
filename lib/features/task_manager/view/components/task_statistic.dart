import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class TaskStatistic extends StatelessWidget {
  final List<double> data =
      getIt.get<TaskManagerViewModel>().getDailyTaskCounts();
  TaskStatistic({super.key});

  List<FlSpot> get spots {
    return List.generate(
      data.length,
      (index) => FlSpot(index.toDouble(), data[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width * 0.9,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine:
                (value) => FlLine(
                  color: theme.colorScheme.onSurface.withAlpha(20),
                  strokeWidth: 1,
                ),
            getDrawingVerticalLine:
                (value) => FlLine(
                  color: theme.colorScheme.onSurface.withAlpha(20),
                  strokeWidth: 1,
                ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget:
                    (value, meta) => Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withAlpha(70),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      days[value.toInt() % days.length],
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
                interval: 1,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: theme.colorScheme.primary.withAlpha(50),
              width: 1,
            ),
          ),
          minX: 0,
          maxX: data.length > 0 ? data.length - 1.0 : 6,
          minY: 0,
          maxY:
              data.isNotEmpty ? (data.reduce((a, b) => a > b ? a : b) + 2) : 10,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 3,
              color: theme.colorScheme.primary,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withAlpha(30),
                    theme.colorScheme.primary.withAlpha(50),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter:
                    (spot, percent, bar, index) => FlDotCirclePainter(
                      radius: 4,
                      color: theme.colorScheme.onSurface,
                      strokeWidth: 2,
                      strokeColor: theme.colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
