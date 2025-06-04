import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';
import 'package:prayer_reminder/features/task_manager/view/components/empty_list.dart';
import 'package:prayer_reminder/features/task_manager/view/components/list_tasks.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class Tasks extends StatelessWidget {
  final TextEditingController titleC;
  final TextEditingController descC;
  final TextEditingController timeC;
  const Tasks({
    super.key,
    required this.titleC,
    required this.descC,
    required this.timeC,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final taskManagerVM = getIt<TaskManagerViewModel>();
    return BlocConsumer<TaskManagerViewModel, TaskManagerState>(
      bloc: getIt<TaskManagerViewModel>(),
      listener: (context, state) {
        if (state is TaskManagaerTaskAddedState) {
          EasyLoading.dismiss();
          taskManagerVM.getTasks();
          EasyLoading.showToast(
            "Task added successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerSuccessDeleteState) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
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
          EasyLoading.showToast(
            "Task completed successfully",
            toastPosition: EasyLoadingToastPosition.bottom,
          );
        } else if (state is TaskManagerTaskCancelled) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
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
          return ListTasks(titleC: titleC, descC: descC, timeC: timeC);
        } else if (state is TaskManagerErrorState) {
          return Text(
            state.error,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.error,
            ),
          );
        } else if (state is taskManagerEmptyState) {
          return const EmptyList();
        } else {
          return ListTasks(titleC: titleC, descC: descC, timeC: timeC);
        }
      },
    );
  }
}
