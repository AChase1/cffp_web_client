import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WeekButton extends StatefulWidget {
  final String? selectedWeek;
  final String? week;
  final Function(String?) onClick;
  const WeekButton({super.key, required this.week, required this.onClick, required this.selectedWeek});

  @override
  State<WeekButton> createState() => _WeekButtonState();
}

class _WeekButtonState extends State<WeekButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        widget.onClick(widget.week);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: widget.selectedWeek == widget.week
                    ? BoxDecoration(
                        border: Border.all(
                          color: context.colors.tertiary,
                          width: 1.5,
                        ),
                      )
                    : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.week ?? '',
                    style: context.fonts.headlineSmall?.copyWith(
                      color: widget.selectedWeek == widget.week ? context.colors.onSecondary : context.colors.onPrimary.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
