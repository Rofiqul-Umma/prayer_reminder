import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_canceled.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_completed.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_total.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_todo.dart';

class GridTaskStatus extends StatelessWidget {
  const GridTaskStatus({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.3,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [CardTodo(), CardCompleted(), CardTotal(), CardCanceled()],
      ),
    );
  }
}
