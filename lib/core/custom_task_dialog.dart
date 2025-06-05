import 'package:flutter/material.dart';
import 'package:prayer_reminder/core/custom_text_filed.dart';
import 'package:prayer_reminder/features/date_time_picker/view/date_time_picker.dart';

class CustomTaskDialog extends StatelessWidget {
  final String title;
  final String description;
  final String cancelText;
  final String confirmText;
  final String? initialTitle;
  final String? initialDescription;
  final bool? isDisabled;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController timeController;
  final String titleHint;
  final String descriptionHint;
  final int titleMaxLines;
  final int descriptionMaxLines;
  final int? descriptionMaxLength;
  final VoidCallback? onCancel;
  final Future<void> Function(String title, String description)? onConfirm;

  const CustomTaskDialog({
    super.key,
    required this.title,
    required this.description,
    required this.titleController,
    required this.descriptionController,
    required this.timeController,
    this.cancelText = 'Cancel',
    this.isDisabled = false,
    this.initialTitle,
    this.initialDescription,
    this.confirmText = 'Add Task',
    this.titleHint = 'Enter your task title',
    this.descriptionHint = 'Enter task description',
    this.titleMaxLines = 1,
    this.descriptionMaxLines = 5,
    this.descriptionMaxLength,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(description),
      actions: [
        CustomTextField(
          initialValue: initialTitle,
          controller: titleController,
          hintText: titleHint,
          theme: theme,
          maxLines: titleMaxLines,
          size: size,
        ),
        SizedBox(height: size.height * 0.02),
        CustomTextField(
          initialValue: initialDescription,
          controller: descriptionController,
          hintText: descriptionHint,
          theme: theme,
          maxLines: descriptionMaxLines,
          maxLength: descriptionMaxLength,
          size: size,
        ),
        if (isDisabled == false) ...[
          SizedBox(height: size.height * 0.02),
          DateTimePicker(timeController: timeController),
        ],
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                titleController.clear();
                descriptionController.clear();
                Navigator.of(context).pop();
                if (onCancel != null) onCancel!();
              },
              child: Text(
                cancelText,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: size.width * 0.02),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (onConfirm != null) {
                  await onConfirm!(
                    titleController.text,
                    descriptionController.text,
                  );
                }
                titleController.clear();
                descriptionController.clear();
                timeController.clear();
              },
              child: Text(
                confirmText,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
