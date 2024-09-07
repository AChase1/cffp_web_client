import 'package:cffp_web/api/providers/login_provider.dart';
import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/login_page/gui/login_button.dart';
import 'package:cffp_web/login_page/gui/login_title.dart';
import 'package:cffp_web/login_page/gui/password/password.dart';
import 'package:cffp_web/login_page/gui/username/username.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

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
        child: SingleChildScrollView(
          child: Container(
            height: 550.0,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: containerDecoration(context: context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginTitle(),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
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
                  LoginButton(
                    onClick: () async {
                      if (loginInfo.password != null) {
                        await ref.read(loginProvider.notifier).validatePwd(loginInfo.password!);
                        if (ref.read(loginProvider.notifier).getCurrMember().isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          context.goNamed(gamesPageRouteName);
                        }
                      }
                    },
                    // onClick: () => login(
                    //   loginInfo: loginInfo,
                    //   context: context,
                    //   ref: ref,
                    // ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
