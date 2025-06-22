import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size.width * 0.1),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color ?? theme.cardColor,
              borderRadius: BorderRadius.circular(size.width * 0.1),
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Icon(
                icon,
                color: theme.colorScheme.onSurface,
                size: size.width * 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
