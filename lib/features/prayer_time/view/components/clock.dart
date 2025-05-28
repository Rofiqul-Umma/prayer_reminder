import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 600;
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now(),
      ),
      builder: (context, snapshot) {
        final now = snapshot.data ?? DateTime.now();
        final timeString =
            "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
        final dateFormat = formatDate(DateTime.now(), [dd, ' ', MM, ' ', yyyy]);
        return Column(
          children: [
            Text(
              timeString,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: isMobile ? size.width * 0.15 : size.width * 0.07,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              dateFormat,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? size.width * 0.035 : size.width * 0.01,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
