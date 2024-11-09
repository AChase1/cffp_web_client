import 'package:cffp_web/extensions/ext_string.dart';
import 'package:cffp_web/features/login_page/constants_login.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Contains all of the logic that pertains to the login ux.
///
/// Create an instance of this class to test the login's logic.
class LogicLogin {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  double panelWidth({required BuildContext context}) =>
      (MediaQuery.of(context).size.width < 800)
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.7;
  String? username;
  String? password;

  /// called on the username's text input `onChanged` function
  void updateUsername({required String input}) => username = input;

  /// called on the password's text input `onChanged` function
  void updatePassword({required String input}) => password = input;

  /// makes a network call to authenticate the user to the client
  void login({required BuildContext context}) {
    if (username.isEmptyOrNull()) {
      ToastFeedback.error(
        context: context,
        errorMessage: ConstLogin.missingUsername,
        errorDescription: ConstLogin.missingUsernameDescription,
      );
      return;
    }

    if (password.isEmptyOrNull()) {
      ToastFeedback.error(
        context: context,
        errorMessage: ConstLogin.missingPassword,
        errorDescription: ConstLogin.missingPasswordDescription,
      );
      return;
    }

    /// API TODO => make network call with username and password (use `makeApiCall<T>() from 'api/logic/logic_api.dart')
    ///          => should return access & refresh tokens for authentication
    ///
    /// remove when API is hooked up
    if (username != "test" || password != "a") {
      ToastFeedback.error(
        context: context,
        errorMessage: ConstLogin.incorrect,
        errorDescription: ConstLogin.incorrectDescription,
      );
      return;
    }

    username = '';
    password = '';
    ScaffoldMessenger.of(context).clearSnackBars();

    /// TODO => store tokens in the secure storage provider
    ///      => secureStorage.write(key: accessTokenStorageKey, value: response.data["accessToken"])
    ///      => secureStorage.write(key: refreshTokenStorageKey, value: response.data["refreshToken"])
    ///
    /// TODO => make network call to get current user
    ///      => store current user id in secure storage
    ///      => secureStorage.write(key: currentUserStorageKey, value: response.data["userId"])
    context.goNamed(gamesPageRouteName);
  }
}
