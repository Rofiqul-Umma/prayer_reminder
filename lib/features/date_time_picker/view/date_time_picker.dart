import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/core/custom_text_filed.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/date_time_picker/view_model/date_time_picker_VM.dart';

class DateTimePicker extends StatelessWidget {
  final TextEditingController timeController;
  const DateTimePicker({super.key, required this.timeController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final viewModel = getIt<DateTimePickerVM>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CustomTextField(
            controller: timeController,
            hintText: 'Select Time',
            theme: theme,
            enabled: false,
            size: size,
          ),
        ),
        SizedBox(width: size.width * 0.02),
        IconButton(
          onPressed:
              () async => await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  viewModel.setDateTime(value);
                  timeController.text = viewModel.initialTime.format(context);
                }
              }),
          icon: Icon(
            HugeIcons.strokeRoundedStopWatch,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
