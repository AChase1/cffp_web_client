import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/gui/password/password_input.dart';
import 'package:cffp_web/login_page/gui/password/password_label.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final Function(String) onUpdate;
  final LoginInfo loginInfo;
  const Password({super.key, required this.onUpdate, required this.loginInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PasswordLabel(),
        PasswordInput(
          onUpdate: (input) => onUpdate(input),
          loginInfo: loginInfo,
        ),
      ],
    );
  }
}
