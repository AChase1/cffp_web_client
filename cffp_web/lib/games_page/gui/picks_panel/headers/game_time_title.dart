import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GameTimeTitle extends StatelessWidget {
  final String? selectedGameTime;
  final List<dynamic> allGameTimes;
  final Function(String) onItemClick;
  const GameTimeTitle({
    super.key,
    required this.selectedGameTime,
    required this.allGameTimes,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedGameTime,
        icon: const SizedBox(),
        style:
            context.fonts.bodyLarge?.copyWith(color: context.colors.onPrimary),
        dropdownColor: context.colors.primary,
        items: allGameTimes.map((time) {
          return DropdownMenuItem<String>(
            value: time,
            child: Text(
              time,
              style: context.fonts.headlineSmall
                  ?.copyWith(color: context.colors.tertiary),
            ),
          );
        }).toList(),
        onChanged: (value) {
          onItemClick(value ?? '');
        },
      ),
    );
  }
}
