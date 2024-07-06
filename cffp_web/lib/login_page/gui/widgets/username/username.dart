import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/gui/widgets/username/username_input.dart';
import 'package:cffp_web/login_page/gui/widgets/username/username_label.dart';
import 'package:flutter/material.dart';

class Username extends StatelessWidget {
  final Function(String) onUpdate;
  final LoginInfo loginInfo;
  const Username({super.key, required this.onUpdate, required this.loginInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UsernameLabel(),
        UsernameInput(
          onUpdate: (input) => onUpdate(input),
          loginInfo: loginInfo,
        ),
      ],
    );
  }
}
