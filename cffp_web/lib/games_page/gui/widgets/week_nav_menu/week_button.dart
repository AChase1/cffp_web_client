import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:cffp_web/games_page/functions/game_page_functions.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WeekButton extends StatefulWidget {
  final Week selectedWeek;
  final Week week;
  final Function(Week) onClick;
  const WeekButton(
      {super.key,
      required this.week,
      required this.onClick,
      required this.selectedWeek});

  @override
  State<WeekButton> createState() => _WeekButtonState();
}

class _WeekButtonState extends State<WeekButton> {
  @override
  Widget build(BuildContext context) {
    print("Selected => ${widget.selectedWeek}\nWeek ==> ${widget.week}");
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        widget.onClick(widget.week);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          textAlign: TextAlign.left,
          getWeekString(widget.week),
          style: context.fonts.headlineSmall?.copyWith(
            color: widget.selectedWeek == widget.week
                ? context.colors.tertiary
                : context.colors.tertiary.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
