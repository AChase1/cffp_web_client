import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

class VersusText extends StatelessWidget {
  const VersusText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "VS",
        style:
            context.fonts.bodyLarge?.copyWith(color: context.colors.onPrimary),
      ),
    );
  }
}
