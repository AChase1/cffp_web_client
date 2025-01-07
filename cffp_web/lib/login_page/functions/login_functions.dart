import 'package:cffp_web/login_page/data/login_model.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _lgins = [
  {'username': '94', 'password': '28', 'name': 'aaron'},
  {'username': '54', 'password': '33', 'name': 'alex'},
  {'username': '87', 'password': '91', 'name': 'bruce'},
  {'username': '51', 'password': '87', 'name': 'chrissy'},
  {'username': '23', 'password': '98', 'name': 'cory'},
  {'username': '99', 'password': '08', 'name': 'ethan'},
  {'username': '45', 'password': '76', 'name': 'francois'},
  {'username': '68', 'password': '17', 'name': 'graham'},
  {'username': '37', 'password': '25', 'name': 'janet'},
  {'username': '18', 'password': '79', 'name': 'joy'},
  {'username': '14', 'password': '56', 'name': 'sara'},
  {'username': '06', 'password': '47', 'name': 'victoria'},
];

bool validateUsername(String username) {
  // create username format (i.e., must be an email)
  if (_lgins
      .firstWhere(
        (el) => el['username'] == username,
        orElse: () => {},
      )
      .isNotEmpty) {
    return true;
  }
  return false;
}

bool validatePassword(String password) {
  // create password requirements (i.e., must contain a number)
  if (_lgins
      .firstWhere(
        (el) => el['password'] == password,
        orElse: () => {},
      )
      .isNotEmpty) {
    return true;
  }
  return false;
}

void login({required LoginInfo loginInfo, required BuildContext context, required WidgetRef ref}) {
  if (validateUsername(loginInfo.username ?? '') && validatePassword(loginInfo.password ?? '')) {
    // get user from database during production
    context.goNamed(playoffPageRouteName);
  }
}
