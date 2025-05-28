import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/custom_app_bar_back.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_task.dart';
import 'package:prayer_reminder/features/task_manager/view/components/empty_list.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CancelledPage extends StatelessWidget {
  final TextEditingController titleC;
  final TextEditingController descC;

  const CancelledPage({super.key, required this.titleC, required this.descC});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewModel = getIt<TaskManagerViewModel>();
    return Scaffold(
      appBar: customAppBarBack('Cancelled', context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: BlocBuilder<TaskManagerViewModel, TaskManagerState>(
            bloc: getIt<TaskManagerViewModel>(),
            builder: (context, state) {
              if (state is TaskManagerLoadingState) {
                return Loading();
              } else {
                return viewModel.cancelledTask.isEmpty
                    ? EmptyList()
                    : ListView.separated(
                      separatorBuilder:
                          (context, index) =>
                              SizedBox(height: size.height * 0.01),
                      itemCount: viewModel.cancelledTask.length,
                      itemBuilder: (context, index) {
                        return CardTask(
                          isDisabled: true,
                          data: viewModel.cancelledTask[index],
                          index: index,
                          titleC: titleC,
                          descC: descC,
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
