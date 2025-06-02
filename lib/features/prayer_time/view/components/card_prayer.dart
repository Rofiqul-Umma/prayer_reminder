import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';

class CardPrayer extends StatelessWidget {
  final int index;
  final GetPrayerSuccessState state;
  const CardPrayer({super.key, required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 600;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? size.width * 0.05 : size.width * 0.08,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(
            isMobile ? size.width * 0.02 : size.width * 0.01,
          ),
        ),
        child: ListTile(
          leading: Icon(
            HugeIcons.strokeRoundedAlarmClock,
            size: isMobile ? size.width * 0.05 : size.width * 0.02,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            state.data[index].name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: isMobile ? size.width * 0.04 : size.width * 0.015,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            state.data[index].time,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: isMobile ? size.width * 0.03 : size.width * 0.012,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
