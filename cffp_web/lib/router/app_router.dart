import 'package:cffp_web/home_page/gui/home_page.dart';
import 'package:cffp_web/login_page/gui/login_page.dart';
import 'package:go_router/go_router.dart';

const loginRouteName = "loginRoute";
const loginPath = "/login";
const homePageRouteName = "HomePageRoute";
const homePagePath = "/homepage";

final appRouter = GoRouter(
  initialLocation: loginPath,
  routes: [
    LoginRoute(),
    HomePageRoute(),
  ],
);

class LoginRoute extends GoRoute {
  LoginRoute()
      : super(
          name: loginRouteName,
          path: loginPath,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LoginPage(),
          ),
        );
}

class HomePageRoute extends GoRoute {
  HomePageRoute()
      : super(
          name: homePageRouteName,
          path: homePagePath,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        );
}
