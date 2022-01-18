import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      textButtonTheme: buttonTheme);

  static final buttonTheme = TextButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white)));

  static final numberTextFieldDecorations = InputDecoration(
      errorStyle: const TextStyle(color: Colors.black),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      errorBorder: textFieldBorder,
      labelText: 'Mobile Number',
      labelStyle: const TextStyle(color: Colors.black),
      focusedErrorBorder: textFieldBorder,
      focusedBorder: textFieldBorder,
      enabledBorder: textFieldBorder);

  static final msgTextFieldDecorations = InputDecoration(
      errorStyle: const TextStyle(color: Colors.black),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      focusedErrorBorder: textFieldBorder,
      errorBorder: textFieldBorder,
      labelStyle: const TextStyle(color: Colors.black),
      labelText: 'Message (optional)',
      focusedBorder: textFieldBorder,
      enabledBorder: textFieldBorder);

  static final textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(15));
}
