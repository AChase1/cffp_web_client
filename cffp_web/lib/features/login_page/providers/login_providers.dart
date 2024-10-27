import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/login_model.dart';

final loginInfoProvider =
    NotifierProvider<LoginInfoProvider, LoginInfo>(LoginInfoProvider.new);

class LoginInfoProvider extends Notifier<LoginInfo> {
  @override
  LoginInfo build() => LoginInfo();

  void updateUsername({required String input}) {
    state.username = input;
    ref.notifyListeners();
  }

  void updatePassword({required String input}) {
    state.password = input;
    ref.notifyListeners();
  }
}
