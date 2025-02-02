import 'package:cffp_web/dashboard_page/dashboard_page.dart';
import 'package:cffp_web/games_page/gui/games_page.dart';
import 'package:cffp_web/main.dart';
import 'package:cffp_web/navigation_bar/navigation_screen.dart';
import 'package:cffp_web/playoffs_page/playoff_page.dart';
import 'package:cffp_web/standings_page/gui/standings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../login_page/gui/login_page.dart';

const loginRouteName = "loginRoute";
const loginPath = "/login";

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "mainScreenNavigatorKey");
const dashboardPageRouteName = "dashboardRoute";
const dashboardRoute = "/dashboard";

const gamesPageRouteName = "gamesPageRoute";
const gamesPageRoute = "/games";

const standingsPageRouteName = "standingsPageRoute";
const standingsPageRoute = "/standings";

const playoffPageRouteName = "playoffPageRoute";
const playoffPageRoute = "/playoffs";

final appRouter = GoRouter(
  initialLocation: playoffPageRoute,
  routes: [
    PlayoffsRoute(),

    // allows for the navigation bar to overlay whichever go route
    // branch is selected
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: rootNavigatorKey,
          routes: [LoginRoute()],
        ),
      ],
    ),
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

class DashboardRoute extends GoRoute {
  DashboardRoute()
      : super(
          name: dashboardPageRouteName,
          path: dashboardRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardPage(),
          ),
        );
}

class GamesRoute extends GoRoute {
  GamesRoute()
      : super(
          name: gamesPageRouteName,
          path: gamesPageRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: GamesPage(),
          ),
        );
}

class StandingsRoute extends GoRoute {
  StandingsRoute()
      : super(
          name: standingsPageRouteName,
          path: standingsPageRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: StandingsPage(),
          ),
        );
}

class PlayoffsRoute extends GoRoute {
  PlayoffsRoute() : super(name: playoffPageRouteName, path: playoffPageRoute, pageBuilder: (context, state) => const NoTransitionPage(child: PlayoffPage()));
}
