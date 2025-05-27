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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: ListTile(
          leading: Icon(
            HugeIcons.strokeRoundedAlarmClock,
            size: size.width * 0.05,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            state.data[index].name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            state.data[index].time,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
