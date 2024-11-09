import 'package:cffp_web/features/login_page/constants_login.dart';
import 'package:cffp_web/features/login_page/logic_login.dart';
import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final LogicLogin _logic = LogicLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: _logic.panelWidth(context: context),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizing.large,
              vertical: Sizing.large,
            ),
            decoration: containerDecoration(context: context),
            child: Form(
              key: _logic.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DisplayLabel(text: "Login"),
                  const SizedBox(height: Sizing.small),
                  const BodyLabel(text: ConstLogin.username),
                  const SizedBox(height: Sizing.mini),
                  FieldInput(
                    hintText: ConstLogin.usernameHint,
                    onSubmit: (input) => _logic.login(context: context),
                    onChanged: (input) => setState(
                      () => _logic.updateUsername(input: input),
                    ),
                    includeShowButton: false,
                  ),
                  const SizedBox(height: Sizing.small),
                  const BodyLabel(text: ConstLogin.password),
                  const SizedBox(height: Sizing.mini),
                  FieldInput(
                    hintText: ConstLogin.passwordHint,
                    onSubmit: (input) => _logic.login(context: context),
                    onChanged: (input) => setState(
                      () => _logic.updatePassword(input: input),
                    ),
                    includeShowButton: false,
                  ),
                  const SizedBox(height: Sizing.xxLarge),
                  GenericButton(
                    vertPadding: Sizing.mini,
                    isExpanded: true,
                    text: ConstLogin.login,
                    backgroundColor: context.colors.tertiary,
                    onPressed: () => _logic.login(context: context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
