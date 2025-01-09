class LoginInfo {
  String? username;
  String? password;

  LoginInfo({this.password, this.username});

  String printObject() {
    return "Username: $username\nPassword: $password";
  }
}
