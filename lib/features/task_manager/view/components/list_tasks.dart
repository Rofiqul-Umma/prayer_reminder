import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_task.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class ListTasks extends StatelessWidget {
  final TextEditingController titleC;
  final TextEditingController descC;
  final TextEditingController timeC;
  const ListTasks({
    super.key,
    required this.titleC,
    required this.descC,
    required this.timeC,
  });

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
          titleC: titleC,
          descC: descC,
          timeC: timeC,
          index: index,
          data: getIt.get<TaskManagerViewModel>().todos[index],
        );
      },
      itemCount: getIt.get<TaskManagerViewModel>().todos.length,
      shrinkWrap: true,
    );
  }
}
