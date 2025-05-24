import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_canceled.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_completed.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_total.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_todo.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class GridTaskStatus extends StatelessWidget {
  final TaskManagerViewModel viewModel;
  const GridTaskStatus({super.key, required this.viewModel});

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
        children: [
          CardTodo(viewModel: viewModel),
          CardCompleted(viewModel: viewModel),
          CardTotal(viewModel: viewModel),
          CardCanceled(viewModel: viewModel),
        ],
      ),
    );
  }
}
