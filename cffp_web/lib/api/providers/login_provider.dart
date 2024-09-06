import 'dart:async';

import 'package:cffp_web/api/gsheets/creds.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginProvider = AsyncNotifierProvider<LoginProviderNotifier, String>(LoginProviderNotifier.new);

class LoginProviderNotifier extends AsyncNotifier<String> {
  final _prefskey = '3oo5gl1a929';
  @override
  Future<String> build() async {
    final prefs = await SharedPreferences.getInstance();
    final String? loggedIn = prefs.getString(_prefskey);
    return loggedIn ?? "";
  }

  Future<String> _validatePwd(String guess) async {
    final prefs = await SharedPreferences.getInstance();
    var result = await validatePassword(guess);
    await prefs.setString(_prefskey, result);
    return result;
  }

  Future<void> validatePwd(String guess) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _validatePwd(guess);
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefskey);
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _logout();
      return "";
    });
  }
}
