import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/functions/login_functions.dart';
import 'package:cffp_web/login_page/gui/widgets/login_button.dart';
import 'package:cffp_web/login_page/gui/widgets/login_title.dart';
import 'package:cffp_web/login_page/gui/widgets/password/password.dart';
import 'package:cffp_web/login_page/gui/widgets/username/username.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  LoginInfo loginInfo = LoginInfo();

  void updateUsername(String input) {
    setState(() {
      loginInfo.username = input;
    });
  }

  void updatePassword(String input) {
    setState(() {
      loginInfo.password = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Container(
          height: 600.0,
          width: 600.0,
          decoration: containerDecoration(context: context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginTitle(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Username(
                        onUpdate: (input) => updateUsername(input),
                        loginInfo: loginInfo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Password(
                        onUpdate: (input) => updatePassword(input),
                        loginInfo: loginInfo,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: LoginButton(
                    onClick: () => login(
                      loginInfo: loginInfo,
                      context: context,
                      ref: ref,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
