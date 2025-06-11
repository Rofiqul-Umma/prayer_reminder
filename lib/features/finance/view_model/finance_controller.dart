import 'package:flutter/material.dart';

class FinanceController with ChangeNotifier {
  final descC = TextEditingController();
  final amountC = TextEditingController();

  @override
  void dispose() {
    descC.dispose();
    amountC.dispose();
    super.dispose();
  }

  void clearFields() {
    descC.clear();
    amountC.clear();
  }
}
