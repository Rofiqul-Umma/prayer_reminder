import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/task_manager/view/components/card_status.dart';
import 'package:prayer_reminder/features/task_manager/view_model/task_manager_view_model.dart';

class CardTotal extends StatelessWidget {
  final TaskManagerViewModel viewModel;
  const CardTotal({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        return CardStatus(
          icon: HugeIcons.strokeRoundedArchive02,
          title: '${viewModel.allTasks.length} Tasks',
          subtitle: 'Total Tasks',
        );
      },
    );
  }
}
