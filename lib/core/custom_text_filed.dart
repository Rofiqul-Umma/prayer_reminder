import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final IconData? prefixIcon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ThemeData theme;
  final int? maxLines;
  final Size size;
  final String? initialValue;
  final int? hintMaxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.theme,
    required this.size,
    this.maxLength,
    this.initialValue,
    this.maxLines,
    this.prefixIcon,
    this.fontSize,
    this.fontWeight,
    this.hintMaxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,

        hintMaxLines: hintMaxLines ?? 1,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: const OutlineInputBorder(),
        focusColor: theme.colorScheme.surface,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.outline, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.onSurface,
            width: 1.0,
          ),
        ),
      ),
      maxLength: maxLength,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface,
        fontSize: fontSize ?? size.width * 0.035,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
