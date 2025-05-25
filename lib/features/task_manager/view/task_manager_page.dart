import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/custom_task_dialog.dart';
import 'package:prayer_reminder/features/task_manager/view/components/grid_task_status.dart';
import 'package:prayer_reminder/features/task_manager/view/components/list_tasks.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class TaskManagerPage extends StatefulWidget {
  const TaskManagerPage({super.key});

  @override
  State<TaskManagerPage> createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage> {
  late final TaskManagerViewModel viewModel;
  final TextEditingController fieldTaskC = TextEditingController();
  final TextEditingController fieldDescriptionC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    viewModel = getIt.get<TaskManagerViewModel>();
    viewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    fieldTaskC.dispose();
    fieldDescriptionC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Task Manager',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.appBarTheme.titleTextStyle?.color,
            fontSize: size.width * 0.06,
            fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.03),
          child: Container(
            alignment: Alignment.centerLeft,
            color: theme.appBarTheme.shadowColor,
            padding: EdgeInsets.only(
              left: size.width * 0.045,
              bottom: size.height * 0.01,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: size.width * 0.01,
              children: [
                Text(
                  'Manage your tasks efficiently',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.appBarTheme.titleTextStyle?.color,
                    fontSize: size.width * 0.035,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.appBarTheme.titleTextStyle?.color,
                    fontSize: size.width * 0.03,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return CustomTaskDialog(
                    title: 'Create New Task',
                    description: 'Add new task to your list',
                    titleController: fieldTaskC,
                    descriptionController: fieldDescriptionC,
                    onConfirm: (title, description) async {
                      await viewModel.addTask(title, description);
                    },
                  );
                },
              );
            },
            icon: const Icon(HugeIcons.strokeRoundedNoteAdd),
          ),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                GridTaskStatus(viewModel: viewModel),
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
                ListTasks(
                  taskManagerViewModel: viewModel,
                  titleC: fieldTaskC,
                  descC: fieldDescriptionC,
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
