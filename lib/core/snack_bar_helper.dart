import 'package:flutter/material.dart';

class SnackBarHelper {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
          action: action,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      );
    });
  }
}
