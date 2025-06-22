import 'package:flutter/material.dart';

class CustomCardMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  const CustomCardMenu({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      color: theme.cardColor,
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color ?? theme.colorScheme.onSurface),
              SizedBox(height: size.height * 0.01),
              Flexible(
                child: Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontSize: size.width * 0.025,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
