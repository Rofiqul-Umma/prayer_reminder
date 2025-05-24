import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_status.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardTodo extends StatelessWidget {
  final TaskManagerViewModel viewModel;
  const CardTodo({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerViewModel, TaskManagerState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is TaskManagerSuccessState) {
          return CardStatus(
            icon: HugeIcons.strokeRoundedCheckList,
            title: '${state.data.length} Tasks',
            subtitle: 'Todos',
          );
        } else {
          return CardStatus(
            icon: HugeIcons.strokeRoundedCheckList,
            title: '0 Tasks',
            subtitle: 'Todos',
          );
        }
      },
    );
  }
}
