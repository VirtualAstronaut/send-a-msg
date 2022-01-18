import 'package:flutter/material.dart';
import 'package:send_a_msg/screens/main_screen.dart';
import 'package:send_a_msg/theme_data.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(const SendAmsg());
}

class SendAmsg extends StatelessWidget {
  const SendAmsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: MainScreen(),
          themeMode: ThemeMode.light,
          theme: AppTheme.lightThemeData,
        );
      },
    );
  }
}
