import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/core/custom_card_status.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardTotal extends StatelessWidget {
  const CardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<TaskManagerViewModel>(),
      builder: (context, state) {
        return CustomCardStatus(
          icon: HugeIcons.strokeRoundedArchive02,
          title: '${getIt<TaskManagerViewModel>().allTasks.length} Tasks',
          subtitle: 'Total Tasks',
        );
      },
    );
  }
}
