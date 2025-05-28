import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/core/custom_card_status.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_state.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardCompleted extends StatelessWidget {
  const CardCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerViewModel, TaskManagerState>(
      bloc: getIt<TaskManagerViewModel>(),
      builder: (context, state) {
        return CustomCardStatus(
          icon: HugeIcons.strokeRoundedCheckmarkCircle02,
          title: '${getIt<TaskManagerViewModel>().completedTask.length} Tasks',
          subtitle: 'Completed',
        );
      },
    );
  }
}
