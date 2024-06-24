import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.controller,
      this.labelText,
      this.suffixIcon,
      this.obscureText = false,
      this.errorText,
      this.onChanged,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? errorText;
  final int? maxLines;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
