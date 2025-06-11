import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/custom_task_dialog.dart';
import 'package:prayer_reminder/core/pop_up_helper.dart';
import 'package:prayer_reminder/features/task_manager/model/task_model.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_controller.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardTask extends StatelessWidget {
  final int index;
  final TaskModel data;
  final bool isDisabled;
  const CardTask({
    super.key,
    required this.data,
    required this.index,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final controller = getIt<TaskManagerController>();
    return IgnorePointer(
      ignoring: isDisabled,
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              onPressed: (context) {
                controller.taskTitleC.text = data.taskTitle;
                controller.taskDescC.text = data.taskDesc;
                showAdaptiveDialog(
                  context: context,
                  builder: (_) {
                    return CustomTaskDialog(
                      title: "Edit Task",
                      description: "Edit your task details",
                      titleController: controller.taskTitleC,
                      descriptionController: controller.taskDescC,
                      timeController: controller.taskTimeC,
                      isDisabled: true,
                      confirmText: 'Update Task',
                      onConfirm: (title, description) async {
                        await getIt<TaskManagerViewModel>().updateTask(
                          data.id,
                          data.copyWith(
                            taskTitle: title,
                            taskDesc: description,
                          ),
                        );
                        controller.taskTitleC.clear();
                        controller.taskDescC.clear();
                        controller.taskTimeC.clear();
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
              borderRadius: BorderRadius.circular(size.width * 0.02),
              onPressed: (context) {
                PopUpHelper.showConfirmationDialog(
                  context: context,
                  title: 'Delete Confirmation',
                  message: 'Are you sure you want to delete this task?',
                  onConfirm: () async {
                    await getIt<TaskManagerViewModel>().deleteTask(data.id);
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
              borderRadius: BorderRadius.circular(size.width * 0.02),
              onPressed: (context) {
                PopUpHelper.showConfirmationDialog(
                  context: context,
                  title: 'Finish Confirmation',
                  message: 'Are you sure you want to finish this task?',
                  onConfirm: () async {
                    await getIt<TaskManagerViewModel>().completeTask(
                      data.id,
                      data,
                    );
                  },
                  onCancel: () async {
                    Navigator.of(context).pop();
                  },
                );
              },
              backgroundColor: theme.colorScheme.surface,
              icon: HugeIcons.strokeRoundedTick01,
              label: 'Finish',
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              onPressed: (context) {
                PopUpHelper.showConfirmationDialog(
                  context: context,
                  title: 'Cancel Confirmation',
                  message: 'Are you sure you want to cancel this task?',
                  onConfirm: () async {
                    await getIt<TaskManagerViewModel>().cancelTask(
                      data.id,
                      data,
                    );
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
                decoration: isDisabled ? TextDecoration.lineThrough : null,
                color:
                    isDisabled
                        ? theme.colorScheme.onSurfaceVariant
                        : theme.colorScheme.onSurface,
              ),
              maxLines: 1,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: size.width * 0.02,
              children: [
                Flexible(
                  child: Text(
                    data.taskDesc,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w300,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  spacing: size.width * 0.03,
                  children: [
                    Row(
                      spacing: size.width * 0.01,
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedCalendar01,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: size.width * 0.04,
                        ),
                      ],
                    ),
                    Text(
                      '${data.dueDate.toLocal().toIso8601String().substring(0, 10)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w300,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Row(
                      spacing: size.width * 0.01,
                      children: [
                        Row(
                          children: [
                            Icon(
                              HugeIcons.strokeRoundedAlarmClock,
                              color: theme.colorScheme.onSurfaceVariant,
                              size: size.width * 0.04,
                            ),
                          ],
                        ),
                        Text(
                          ' ${data.dueDate.toLocal().toIso8601String().substring(11, 16)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w300,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                data.isCancelled
                    ? HugeIcons.strokeRoundedCancelCircle
                    : data.isCompleted
                    ? HugeIcons.strokeRoundedCheckmarkCircle02
                    : HugeIcons.strokeRoundedMoreVertical,
                color: theme.colorScheme.onSurface,
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
      ),
    );
  }
}
