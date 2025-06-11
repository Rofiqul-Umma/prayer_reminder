import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_task.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: size.height * 0.01);
      },
      itemBuilder: (context, index) {
        return CardTask(
          isDisabled: false,
          index: index,
          data: getIt.get<TaskManagerViewModel>().todos[index],
        );
      },
      itemCount: getIt.get<TaskManagerViewModel>().todos.length,
      shrinkWrap: true,
    );
  }
}
