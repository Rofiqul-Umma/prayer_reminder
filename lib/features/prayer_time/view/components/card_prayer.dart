import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/get_prayer/model/prayer_model.dart';

class CardPrayer extends StatelessWidget {
  final PrayerModel data;
  final String hadith;
  const CardPrayer({super.key, required this.data, required this.hadith});

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
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? size.width * 0.03 : size.width * 0.015,
          horizontal: isMobile ? size.width * 0.03 : size.width * 0.015,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              HugeIcons.strokeRoundedAlarmClock,
              size: isMobile ? size.width * 0.05 : size.width * 0.02,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(width: isMobile ? size.width * 0.03 : size.width * 0.015),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize:
                          isMobile ? size.width * 0.04 : size.width * 0.015,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: isMobile ? size.width * 0.01 : size.width * 0.005,
                  ),
                  Text(
                    hadith,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize:
                          isMobile ? size.width * 0.035 : size.width * 0.013,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(width: isMobile ? size.width * 0.02 : size.width * 0.01),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                data.time,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? size.width * 0.03 : size.width * 0.012,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
