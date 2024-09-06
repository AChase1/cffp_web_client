import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool validateUsername(String username) {
  // create username format (i.e., must be an email)
  return username == 'test' ? true : false;
}

bool validatePassword(String password) {
  // create password requirements (i.e., must contain a number)
  return password == 'a' ? true : false;
}

void login(
    {required LoginInfo loginInfo,
    required BuildContext context,
    required WidgetRef ref}) {
  if (validateUsername(loginInfo.username ?? '') &&
      validatePassword(loginInfo.password ?? '')) {
    // get user from database during production
    context.goNamed(gamesPageRouteName);
  }
}
