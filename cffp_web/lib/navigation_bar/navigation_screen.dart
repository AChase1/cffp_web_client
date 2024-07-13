import 'package:cffp_web/navigation_bar/nav_bar/nav_bar.dart';
import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationScreen({super.key, required this.navigationShell});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    late bool isDashboardPage;
    late bool isGamesPage;
    late bool isStandingsPage;

    if (GoRouter.of(context)
        .routeInformationProvider
        .value
        .uri
        .toString()
        .contains(dashboardRoute)) {
      isDashboardPage = true;
      isGamesPage = false;
      isStandingsPage = false;
    }

    if (GoRouter.of(context)
        .routeInformationProvider
        .value
        .uri
        .toString()
        .contains(gamesPageRoute)) {
      isDashboardPage = false;
      isGamesPage = true;
      isStandingsPage = false;
    }

    if (GoRouter.of(context)
        .routeInformationProvider
        .value
        .uri
        .toString()
        .contains(standingsPageRoute)) {
      isDashboardPage = false;
      isGamesPage = false;
      isStandingsPage = true;
    }

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 25.0),
        child: Column(
          children: [
            NavBar(
              isDashboardPage: isDashboardPage,
              isGamesPage: isGamesPage,
              isStandingsPage: isStandingsPage,
            ),
            Expanded(
              child: widget.navigationShell,
            ),
          ],
        ),
      ),
    );
  }
}
