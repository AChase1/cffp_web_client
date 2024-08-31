import 'package:cffp_web/api/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserProvider =
    NotifierProvider<CurrentUser, User>(CurrentUser.new);

class CurrentUser extends Notifier<User> {
  @override
  User build() {
    return User();
  }

  void updateState({required User user}) {
    if (user != user) {
      state = user;
    }
  }
}
