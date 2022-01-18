import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.fontSize})
      : super(key: key);
  final String text;
  final Icon icon;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      style: Theme.of(context).textButtonTheme.style,
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
