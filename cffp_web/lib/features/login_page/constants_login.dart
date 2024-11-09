abstract class ConstLogin {
  static const String username = "Username:";
  static const String usernameHint = "john.smith@email.com";
  static const String password = "Password:";
  static const String passwordHint = "Password#1234";
  static const String login = "Login";

  /// error messages
  static const String incorrect = "Incorrect username or password";
  static const String incorrectDescription =
      "Please re-enter your username and/or password. If you've forgotten your password, please contact Ethan.";

  static const String missingUsername = "Missing username";
  static const String missingUsernameDescription =
      "Your username seems to be missing, please enter your username to continue.";

  static const String missingPassword = "Missing password";
  static const String missingPasswordDescription =
      "Your password seems to be missing, please enter your password to continue.";
}
