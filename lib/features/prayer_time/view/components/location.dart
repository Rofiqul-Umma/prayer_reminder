import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';

class Location extends StatelessWidget {
  final GetCurrentLocationSuccessState state;
  const Location({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 600;
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          HugeIcons.strokeRoundedLocation01,
          size: isMobile ? size.width * 0.04 : size.width * 0.015,
          color: Theme.of(context).iconTheme.color,
        ),
        Text(
          state.data.subLocality,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: isMobile ? size.width * 0.035 : size.width * 0.015,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
