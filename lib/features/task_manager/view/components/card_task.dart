import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/custom_task_dialog.dart';
import 'package:prayer_reminder/core/pop_up_helper.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardTask extends StatelessWidget {
  final TaskManagerViewModel viewModel;
  final int index;
  final TaskModel data;
  final TextEditingController titleC;
  final TextEditingController descC;
  const CardTask({
    super.key,
    required this.data,
    required this.viewModel,
    required this.index,
    required this.titleC,
    required this.descC,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              titleC.text = data.taskTitle;
              descC.text = data.taskDesc;
              showAdaptiveDialog(
                context: context,
                builder: (_) {
                  return CustomTaskDialog(
                    title: "Edit Task",
                    description: "Edit your task details",
                    titleController: titleC,
                    descriptionController: descC,
                    confirmText: 'Update Task',
                    onConfirm: (title, description) async {
                      final updatedTask = data.copyWith(
                        taskTitle: title,
                        taskDesc: description,
                      );
                      await viewModel.updateTask(data.id, updatedTask);
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            backgroundColor: theme.colorScheme.surface,
            icon: HugeIcons.strokeRoundedEdit01,
            label: 'Edit',
          ),

          SlidableAction(
            onPressed: (context) {
              PopUpHelper.showConfirmationDialog(
                context: context,
                title: 'Delete Confirmation',
                message: 'Are you sure you want to delete this task?',
                onConfirm: () async {
                  await viewModel.deleteTask(data.id);
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },

            backgroundColor: theme.colorScheme.surface,
            icon: HugeIcons.strokeRoundedDelete01,
            label: 'Delete',
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              PopUpHelper.showConfirmationDialog(
                context: context,
                title: 'Finish Confirmation',
                message: 'Are you sure you want to finish this task?',
                onConfirm: () async {
                  await viewModel.completeTask(data.id, data);
                },
                onCancel: () async {
                  Navigator.of(context).pop();
                },
              );
            },
            backgroundColor: theme.colorScheme.surface,
            icon: HugeIcons.strokeRoundedTaskDaily02,
            label: 'Finish',
          ),
          SlidableAction(
            onPressed: (context) {
              PopUpHelper.showConfirmationDialog(
                context: context,
                title: 'Cancel Confirmation',
                message: 'Are you sure you want to cancel this task?',
                onConfirm: () async {
                  await viewModel.cancelTask(data.id, data);
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },
            backgroundColor: theme.colorScheme.surface,
            icon: HugeIcons.strokeRoundedCancel01,
            label: 'Cancel',
          ),
        ],
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          color: theme.colorScheme.surface,
        ),
        padding: EdgeInsets.all(size.width * 0.02),
        child: ListTile(
          title: Text(
            data.taskTitle,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          subtitle: Text(
            data.createdAt.toUtc().toString().substring(0, 10),
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              HugeIcons.strokeRoundedFile01,
              color: theme.colorScheme.secondary,
              size: size.width * 0.08,
            ),
            onPressed: () {
              PopUpHelper.showTaskDetailsDialog(
                context: context,
                title: data.taskTitle,
                description: data.taskDesc,
              );
            },
          ),
        ),
      ),
    );
  }
}
