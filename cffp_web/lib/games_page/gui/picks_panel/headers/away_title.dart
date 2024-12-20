import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

class PicksPanelAwayTitle extends StatelessWidget {
  const PicksPanelAwayTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Away",
      style: context.fonts.bodyLarge?.copyWith(
        color: context.colors.tertiary.withOpacity(0.5),
      ),
    );
  }
}
