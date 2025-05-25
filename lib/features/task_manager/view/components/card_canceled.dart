import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/custom_card_status.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardCanceled extends StatelessWidget {
  final TaskManagerViewModel viewModel;
  const CardCanceled({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerViewModel, TaskManagerState>(
      bloc: viewModel,
      builder: (context, state) {
        return CustomCardStatus(
          icon: HugeIcons.strokeRoundedCancelCircle,
          title: '${viewModel.cancelledTask.length} Tasks',
          subtitle: 'Canceled',
        );
      },
    );
  }
}
