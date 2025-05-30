import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_reminder/core/custom_text_filed.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/finance/model/expanses_category_model.dart';
import 'package:prayer_reminder/features/finance/view_model/finance_view_model.dart';

class AlertAddExpanses extends StatelessWidget {
  final TextEditingController descC;
  final TextEditingController amountC;
  const AlertAddExpanses({
    super.key,
    required this.descC,
    required this.amountC,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return AlertDialog.adaptive(
      title: Text('Add New Expanses'),
      content: Text(
        'Enter the details of your new expense.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: MediaQuery.sizeOf(context).width * 0.035,
        ),
      ),
      actions: [
        DropdownButtonFormField<String>(
          hint: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Category',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: MediaQuery.sizeOf(context).width * 0.035,
              ),
            ),
          ),
          items:
              expansesData.map((data) {
                return DropdownMenuItem<String>(
                  value: data.name,
                  child: Text(
                    data.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: MediaQuery.sizeOf(context).width * 0.035,
                    ),
                  ),
                );
              }).toList(),
          onChanged: (value) {
            getIt.get<FinanceViewModel>().setSelectedCategory(value);
          },
        ),
        SizedBox(height: size.height * 0.02),
        CustomTextField(
          controller: descC,
          hintText: 'Description',
          theme: theme,
          size: size,
          maxLength: 50,
          maxLines: 5,
        ),
        SizedBox(height: size.height * 0.02),
        CustomTextField(
          controller: amountC,
          hintText: 'Amount',
          theme: theme,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            FilteringTextInputFormatter.singleLineFormatter,
            FilteringTextInputFormatter.deny(RegExp(r'^0\d')),
          ],
          keyboardType: TextInputType.number,
          size: size,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await getIt.get<FinanceViewModel>().saveFinanceData(
                  descC.text,
                  int.parse(amountC.text),
                );
                descC.clear();
                amountC.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
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
