import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.theme,
    required this.size,
    this.inputFormatters,
    this.keyboardType,
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
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintMaxLines: hintMaxLines ?? 1,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: BorderSide.none,
        ),
        focusColor: theme.colorScheme.surface,
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
