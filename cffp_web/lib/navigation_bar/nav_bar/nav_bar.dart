import 'package:cffp_web/navigation_bar/nav_bar/widgets/cffp_title.dart';
import 'package:cffp_web/navigation_bar/nav_bar/widgets/dashboard_nav_button.dart';
import 'package:cffp_web/navigation_bar/nav_bar/widgets/games_nav_button.dart';
import 'package:cffp_web/navigation_bar/nav_bar/widgets/standings_nav_button.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final bool isDashboardPage;
  final bool isGamesPage;
  final bool isStandingsPage;
  const NavBar(
      {super.key,
      required this.isDashboardPage,
      required this.isGamesPage,
      required this.isStandingsPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CffpTitle(),
            Padding(
              padding: EdgeInsets.only(left: 60.0, top: 10.0),
              child: DashboardNavButton(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, top: 10.0),
              child: GamesNavButton(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, top: 10.0),
              child: StandingsNavButton(),
            ),
          ],
        ),
        Divider(
          color: context.colors.tertiary,
          thickness: 5.0,
          endIndent: 0.0,
          indent: 0.0,
        ),
      ],
    );
  }
}
