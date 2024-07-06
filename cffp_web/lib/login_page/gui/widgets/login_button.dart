import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Function() onClick;
  const LoginButton({super.key, required this.onClick});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        widget.onClick();
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: containerDecoration(
                  context: context, color: context.colors.tertiaryContainer),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "LOGIN",
                    style: context.fonts.headlineSmall
                        ?.copyWith(color: context.colors.primary),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
