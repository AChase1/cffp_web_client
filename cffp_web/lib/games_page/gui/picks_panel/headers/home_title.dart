import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

class PicksPanelHomeTitle extends StatelessWidget {
  const PicksPanelHomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Home",
      style: context.fonts.bodyLarge?.copyWith(
        color: context.colors.tertiary.withOpacity(0.5),
      ),
    );
  }
}
