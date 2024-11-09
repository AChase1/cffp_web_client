import 'package:cffp_web/navigation_bar/nav_bar/cffp_title.dart';
import 'package:cffp_web/navigation_bar/nav_bar/games_nav_button.dart';
import 'package:cffp_widgets/cffp_widgets.dart';
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
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                const CffpTitle(),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                  child: GamesNavButton(isGamesPage: isGamesPage),
                ),
              ],
            ),
            Divider(
              color: context.colors.onPrimary,
              thickness: 2.0,
              endIndent: 0.0,
              indent: 0.0,
            ),
          ],
        ),
      ],
    );
  }
}
