import 'package:flutter/material.dart';

class BlackBorderTextField extends StatelessWidget {
  const BlackBorderTextField(
      {Key? key,
      required this.controller,
      this.maxLength,
      this.validator,
      this.label,
      this.maxLines,
      this.inputDecoration,
      this.keyboardType = TextInputType.text})
      : super(key: key);
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String? label;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;
  final InputDecoration? inputDecoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        maxLines: maxLines,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: inputDecoration);
  }
}
