import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final int? maxLength;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;

  const CustomInput({
    Key? key,
    required this.controller,
    this.maxLines = 1,
    this.maxLength = 50,
    this.labelText,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        helperStyle: const TextStyle(color: Colors.white),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
