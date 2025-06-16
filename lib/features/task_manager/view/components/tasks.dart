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
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final taskManagerVM = getIt<TaskManagerViewModel>();
    return BlocConsumer<TaskManagerViewModel, TaskManagerState>(
      bloc: getIt<TaskManagerViewModel>(),
      listener: (context, state) {
        state.maybeWhen(
          taskAdded: (data) {
            EasyLoading.dismiss();
            taskManagerVM.getTasks();
            taskManagerVM.getDailyTaskCounts();
            EasyLoading.showToast(
              "Task added successfully",
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          successDelete: () {
            EasyLoading.dismiss();
            Navigator.of(context).pop();
            EasyLoading.showToast(
              "Task deleted successfully",
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          errorAddTask: (error) {
            EasyLoading.dismiss();
            EasyLoading.showToast(
              error,
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          taskCompleted: () {
            EasyLoading.dismiss();
            Navigator.of(context).pop();
            EasyLoading.showToast(
              "Task completed successfully",
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          taskCancelled: () {
            EasyLoading.dismiss();
            Navigator.of(context).pop();
            EasyLoading.showToast(
              "Task cancelled successfully",
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          loadingAddTask: () {
            EasyLoading.show(status: 'Adding Task...');
          },
          loadingUpdateTask: () {
            EasyLoading.show(status: 'Updating Task...');
          },
          loadingCompleteTask: () {
            EasyLoading.show(status: 'Completing Task...');
          },
          loadingCancelTask: () {
            EasyLoading.show(status: 'Cancelling Task...');
          },
          loadingDeleteTask: () {
            EasyLoading.show(status: 'Deleting Task...');
          },
          error: (error) {
            EasyLoading.dismiss();
            EasyLoading.showToast(
              error,
              toastPosition: EasyLoadingToastPosition.bottom,
            );
          },
          orElse: () {
            EasyLoading.dismiss();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Loading(),
          success: (data) => ListTasks(),
          error:
              (error) => Text(
                error,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          empty: () => const EmptyList(),
          orElse: () => ListTasks(),
        );
      },
    );
  }
}
