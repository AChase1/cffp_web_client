import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/functions/login_functions.dart';
import 'package:cffp_web/login_page/gui/widgets/username/username_clear_button.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsernameInput extends ConsumerStatefulWidget {
  final Function(String) onUpdate;
  final LoginInfo loginInfo;
  const UsernameInput(
      {super.key, required this.onUpdate, required this.loginInfo});

  @override
  ConsumerState<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends ConsumerState<UsernameInput> {
  TextEditingController usernameController = TextEditingController();
  bool isValidUsername = true;

  void validateField(String usernameInput) {
    setState(() {
      isValidUsername = validateUsername(usernameInput) ? true : false;
    });
  }

  void clearInput() {
    setState(() {
      usernameController.clear();
      isValidUsername = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (usernameController.text.isEmpty) {
      isValidUsername = true;
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
        controller: usernameController,
        cursorColor: context.colors.primary,
        onChanged: (value) {
          validateField(value);
          widget.onUpdate(value);
        },
        decoration: InputDecoration(
          hintText: "Ex: JohnSmith01",
          suffix: usernameController.text.isNotEmpty
              ? UsernameClearButton(onClick: () => clearInput())
              : const SizedBox(),
          error: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  height: isValidUsername ? 0.0 : 35.0,
                  decoration: containerDecoration(
                      context: context,
                      color: context.colors.error,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Text(
                      "Username is incorrect",
                      style: context.fonts.bodyLarge
                          ?.copyWith(color: context.colors.onError),
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
