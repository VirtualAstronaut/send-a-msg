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
  String msg = "";
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
                    child: Text('Formatting'),
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
                        msg = msgController.text;
                        if (selectedButtonsValues[0]) {
                          msg = "*" + msg + "*";
                        } else {
                          if (RegExp(r"^[*].*[*]$").hasMatch(msg) ||
                              RegExp(r"^.[*].*[*].$").hasMatch(msg)) {
                            msg = msg.replaceAll("*", "");
                          }
                        }
                        if (selectedButtonsValues[1]) {
                          msg = "_" + msg + "_";
                        } else {
                          if (RegExp(r"^[_].*[_]$").hasMatch(msg) ||
                              RegExp(r"^.[_].*[_].$").hasMatch(msg)) {
                            msg = msg.replaceAll("_", "");
                          }
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
                    msg = msg.replaceAll(" ", "%20");
                    if (await canLaunch(
                        'https://wa.me/${numberController.text}')) {
                      await launch(
                          'https://wa.me/${numberController.text}?text=$msg');
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
}
