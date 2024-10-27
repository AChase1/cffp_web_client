import 'package:cffp_web/api/providers/login_provider.dart';
import 'package:cffp_web/extensions.dart';
import 'package:cffp_web/features/login_page/data/login_model.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/login_providers.dart';

abstract class LoginFunc {
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static String? validateUsername({required String text}) => text.isEmail();

  static void updateUsername({required WidgetRef ref, required String input}) =>
      ref.read(loginInfoProvider.notifier).updateUsername(input: input);

  static void updatePassword({required WidgetRef ref, required String input}) =>
      ref.read(loginInfoProvider.notifier).updatePassword(input: input);

  static void login({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    if (!(loginFormKey.currentState?.validate() ?? true)) {
      return;
    }
    context.goNamed(loginRouteName);
  }
}
