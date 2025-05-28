import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Text(
          """No tasks available yet, Please add a task to get started.""",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
