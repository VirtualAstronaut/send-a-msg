import 'package:send_a_msg/components/black_border_textfield.dart';
import 'package:send_a_msg/components/black_button.dart';
import 'package:send_a_msg/theme_data.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final TextEditingController numberController = TextEditingController();
  static final TextEditingController msgController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<bool> selectedButtonsValues = [false, false];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 9.h,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Send A Message'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60.w,
                child: BlackBorderTextField(
                    controller: msgController,
                    maxLines: 4,
                    inputDecoration: AppTheme.msgTextFieldDecorations),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 60.w,
                child: BlackBorderTextField(
                  controller: numberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 16,
                  inputDecoration: AppTheme.numberTextFieldDecorations,
                ),
              ),
              SizedBox(height: 1.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Formatting',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ToggleButtons(
                      color: Colors.black,
                      fillColor: Colors.black12,
                      renderBorder: false,
                      selectedColor: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.black,
                      onPressed: (int index) {
                        selectedButtonsValues[index] =
                            !selectedButtonsValues[index];
                        if (selectedButtonsValues[0]) {
                          if (!isFormatted("*")) {
                            msgController.text = "*" + msgController.text + "*";
                          }
                        } else {
                          msgController.text =
                              msgController.text.replaceAll("*", "");
                        }
                        if (selectedButtonsValues[1]) {
                          if (!isFormatted("_")) {
                            msgController.text = "_" + msgController.text + "_";
                          }
                        } else {
                          msgController.text =
                              msgController.text.replaceAll("_", "");
                        }
                        setState(() {});
                      },
                      children: const [
                        Icon(Icons.format_bold_outlined),
                        Icon(
                          Icons.format_italic_outlined,
                        )
                      ],
                      isSelected: selectedButtonsValues),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlackButton(
                icon: const Icon(Icons.chat_bubble_outline_outlined),
                text: 'Open WhatsApp',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (await canLaunch(
                        'https://wa.me/${numberController.text}')) {
                      await launch(
                          'https://wa.me/${numberController.text}?text=${msgController.text}');
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isFormatted(String char) {
    return RegExp("^[$char].*[$char]\$").hasMatch(msgController.text) ||
        RegExp("^.[$char].*[$char].\$").hasMatch(msgController.text);
  }
}
