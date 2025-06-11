import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/custom_task_dialog.dart';
import 'package:prayer_reminder/features/date_time_picker/view_model/date_time_picker_VM.dart';
import 'package:prayer_reminder/features/task_manager/view/components/grid_task_status.dart';
import 'package:prayer_reminder/features/task_manager/view/components/task_statistic.dart';
import 'package:prayer_reminder/features/task_manager/view/components/tasks.dart';
import 'package:prayer_reminder/features/task_manager/view/components/task_manager_app_bar.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_controller.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class TaskManagerPage extends StatelessWidget {
  const TaskManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    final controller = getIt<TaskManagerController>();
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Task Manager',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontSize: size.width * 0.06,
            fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
          ),
        ),
        bottom: taskManagerAppBar(size, theme),
        actions: [
          IconButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return CustomTaskDialog(
                    title: 'Create New Task',
                    description: 'Add new task to your list',
                    titleController: controller.taskTitleC,
                    timeController: controller.taskTimeC,
                    descriptionController: controller.taskDescC,
                    onConfirm:
                        (title, description) async =>
                            await getIt<TaskManagerViewModel>().addTask(
                              title,
                              description,
                              getIt.get<DateTimePickerVM>().state,
                            ),
                  );
                },
              );
            },
            icon: Icon(
              HugeIcons.strokeRoundedNoteAdd,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  GridTaskStatus(),
                  SizedBox(height: size.height * 0.015),
                  Text(
                    'Task Statistics',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: size.width * 0.04,
                      fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TaskStatistic(),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Todos',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: size.width * 0.04,
                      fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Tasks(),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
