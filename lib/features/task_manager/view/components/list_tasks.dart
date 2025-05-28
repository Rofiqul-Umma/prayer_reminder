import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_task.dart';
import 'package:prayer_reminder/features/task_manager/view/components/empty_list.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class ListTasks extends StatelessWidget {
  final TextEditingController titleC;
  final TextEditingController descC;
  const ListTasks({super.key, required this.titleC, required this.descC});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<TaskManagerViewModel, TaskManagerState>(
      bloc: getIt<TaskManagerViewModel>(),
      listener: (context, state) {
        if (state is TaskManagaerTaskAddedState) {
          EasyLoading.dismiss();
          getIt<TaskManagerViewModel>().getTasks();
          EasyLoading.showToast(
            "Task added successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerSuccessDeleteState) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
          getIt<TaskManagerViewModel>().getTasks();
          EasyLoading.showToast(
            "Task deleted successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerErrorAddTaskState) {
          EasyLoading.dismiss();
          EasyLoading.showToast(
            state.error,
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerTaskCompleted) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
          getIt<TaskManagerViewModel>().getTasks();
          EasyLoading.showToast(
            "Task completed successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerTaskCancelled) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
          getIt<TaskManagerViewModel>().getTasks();
          EasyLoading.showToast(
            "Task cancelled successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerLoadingState) {
          EasyLoading.show(status: "Loading tasks...");
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        if (state is TaskManagerLoadingState) {
          return const Loading();
        } else if (state is TaskManagerSuccessState) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: size.height * 0.01);
              },
              itemBuilder: (context, index) {
                return CardTask(
                  isDisabled: false,
                  titleC: titleC,
                  descC: descC,
                  index: index,
                  data: state.data[index],
                );
              },
              itemCount: state.data.length,
              shrinkWrap: true,
            ),
          );
        } else if (state is TaskManagerErrorState) {
          return Text(
            state.error,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.error,
            ),
          );
        } else {
          return EmptyList();
        }
      },
    );
  }
}
