import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginInfo {
  String? username;
  String? password;

  LoginInfo({this.password, this.username});

  /// for debugging purposes
  String printObject() => "Username: $username\nPassword: $password";
}
