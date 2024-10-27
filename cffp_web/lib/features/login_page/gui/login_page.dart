import 'package:cffp_web/api/providers/login_provider.dart';
import 'package:cffp_web/api/providers/picks_provider.dart';
import 'package:cffp_web/api/providers/week_provider.dart';
import 'package:cffp_web/constants/const_login.dart';
import 'package:cffp_web/features/login_page/functions/login_functions.dart';
import 'package:cffp_web/features/login_page/gui/login_button.dart';
import 'package:cffp_web/features/login_page/gui/password/password.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:cffp_widgets/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'login_input.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizing.large,
                    vertical: Sizing.large,
                  ),
                  decoration: containerDecoration(context: context),
                  child: Form(
                    key: LoginFunc.loginFormKey,
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: context.fonts.displayMedium
                              ?.copyWith(color: context.colors.onPrimary),
                        ),
                        const LoginInput(label: ConstLogin.username),
                        const SizedBox(height: Sizing.small),
                        const LoginInput(label: ConstLogin.password),
                        GenericButton
                        LoginButton(
                          loading: loading,
                          onClick: () async {
                            if (loginInfo.password != null) {
                              setState(() {
                                loading = true;
                              });
                              await ref
                                  .read(loginProvider.notifier)
                                  .validatePwd(loginInfo.password!);
                              if (ref
                                      .read(loginProvider.notifier)
                                      .getCurrMember()
                                      ?.isNotEmpty ??
                                  false) {
                                await ref
                                    .read(picksProvider.notifier)
                                    .getCurrPicks(ref.read(weekProvider));
                                setState(() {
                                  loading = false;
                                });
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
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
