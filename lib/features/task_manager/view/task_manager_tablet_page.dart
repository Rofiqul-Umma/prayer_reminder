import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/custom_task_dialog.dart';
import 'package:prayer_reminder/features/date_time_picker/view_model/date_time_picker_VM.dart';
import 'package:prayer_reminder/features/task_manager/view/components/grid_task_status.dart';
import 'package:prayer_reminder/features/task_manager/view/components/tasks.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class TaskManagerTabletPage extends StatefulWidget {
  const TaskManagerTabletPage({super.key});

  @override
  State<TaskManagerTabletPage> createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerTabletPage> {
  final fieldTaskC = TextEditingController();
  final fieldDescriptionC = TextEditingController();
  final timeC = TextEditingController();

  @override
  void dispose() {
    fieldTaskC.dispose();
    fieldDescriptionC.dispose();
    timeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                GridTaskStatus(),
                SizedBox(height: size.height * 0.045),
                Text(
                  'All Tasks',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.appBarTheme.titleTextStyle?.color,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (context) {
              return CustomTaskDialog(
                title: 'Create New Task',
                description: 'Add new task to your list',
                titleController: fieldTaskC,
                descriptionController: fieldDescriptionC,
                timeController: timeC,
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
      ),
    );
  }
}
