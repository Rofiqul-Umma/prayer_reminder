import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomCardStatus extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  const CustomCardStatus({
    super.key,
    this.icon = HugeIcons.strokeRoundedNote01,
    this.title = 'Your Projects',
    this.subtitle = 'Todo',
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Icon(
              icon,
              size: size.width * 0.08,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Your Projects',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  subtitle ?? 'Todo',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
