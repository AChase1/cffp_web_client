import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/functions/login_functions.dart';
import 'package:cffp_web/login_page/gui/username/username_clear_button.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordInput extends ConsumerStatefulWidget {
  final Function(String) onUpdate;
  final LoginInfo loginInfo;
  const PasswordInput({super.key, required this.onUpdate, required this.loginInfo});

  @override
  ConsumerState<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  TextEditingController passwordController = TextEditingController();
  bool isValidPassword = true;

  void validateField(String passwordInput) {
    setState(() {
      isValidPassword = validatePassword(passwordInput) ? true : false;
    });
  }

  void clearInput() {
    setState(() {
      passwordController.clear();
      isValidPassword = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (passwordController.text.isEmpty) {
      isValidPassword = true;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        style: context.fonts.bodyLarge?.copyWith(
          color: context.moreColors.onTextFieldBackground,
        ),
        onSubmitted: (value) => login(
          loginInfo: widget.loginInfo,
          context: context,
          ref: ref,
        ),
        controller: passwordController,
        cursorColor: context.colors.primary,
        // onChanged: (value) {
        //   validateField(value);
        //   widget.onUpdate(value);
        // },
        decoration: InputDecoration(
          hintText: "Ex: Password_#1234",
          suffix: passwordController.text.isNotEmpty ? UsernameClearButton(onClick: () => clearInput()) : const SizedBox(),
          error: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  height: isValidPassword ? 0.0 : 35.0,
                  decoration: isValidPassword
                      ? const BoxDecoration()
                      : containerDecoration(
                          context: context,
                          color: context.colors.error,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Text(
                      "Password is incorrect",
                      style: context.fonts.bodyLarge?.copyWith(color: context.colors.onError),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
