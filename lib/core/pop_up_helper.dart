import 'package:flutter/material.dart';

class PopUpHelper {
  static Future<void> showInfoDialog({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    return showAdaptiveDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(
                cancelText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                confirmText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: onConfirm,
            ),
          ],
        );
      },
    );
  }

  // show dialog for task details
  static Future<void> showTaskDetailsDialog({
    required BuildContext context,
    required String title,
    required String description,
    String buttonText = 'Close',
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
