import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool validateUsername(String username) {
  return username == 'test' ? true : false;
}

bool validatePassword(String password) {
  return password == 'a' ? true : false;
}

void login(LoginInfo loginInfo, BuildContext context) {
  if (validateUsername(loginInfo.username ?? '') &&
      validatePassword(loginInfo.password ?? '')) {
    context.goNamed(homePageRouteName);
  }
}
