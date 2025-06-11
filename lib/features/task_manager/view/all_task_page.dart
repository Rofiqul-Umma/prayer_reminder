import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/custom_app_bar_back.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_task.dart';
import 'package:prayer_reminder/features/task_manager/view/components/empty_list.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewModel = getIt<TaskManagerViewModel>();
    return Scaffold(
      appBar: customAppBarBack('All Todos', context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: BlocBuilder<TaskManagerViewModel, TaskManagerState>(
            bloc: getIt<TaskManagerViewModel>(),
            builder: (context, state) {
              if (state is TaskManagerLoadingState) {
                return Loading();
              } else {
                return viewModel.allTasks.isEmpty
                    ? EmptyList()
                    : ListView.separated(
                      separatorBuilder:
                          (context, index) =>
                              SizedBox(height: size.height * 0.01),
                      itemCount: viewModel.allTasks.length,
                      itemBuilder: (context, index) {
                        return CardTask(
                          isDisabled:
                              viewModel.allTasks[index].isCancelled ||
                              viewModel.allTasks[index].isCompleted,
                          data: viewModel.allTasks[index],
                          index: index,
                        );
                      },
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}
