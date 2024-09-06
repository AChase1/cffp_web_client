import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UsernameClearButton extends StatelessWidget {
  final Function() onClick;
  const UsernameClearButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        onClick();
      },
      child: Icon(
        Icons.close_outlined,
        size: 20.0,
        color: context.colors.onPrimary,
      ),
    );
  }
}
