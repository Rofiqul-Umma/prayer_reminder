import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/stopwatch/view_model/stopwatch_view_model.dart';

class TimerCounter extends StatelessWidget {
  final Duration? time;
  const TimerCounter({super.key, this.time});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final viewModel = getIt<StopwatchViewModel>();
    return Center(
      child: Text(
        viewModel.formatDuration(time ?? Duration.zero),
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineMedium?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.25,
        ),
      ),
    );
  }
}
