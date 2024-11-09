import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

class CffpTitle extends StatelessWidget {
  const CffpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "CFFP",
      style: context.fonts.displaySmall?.copyWith(
        color: context.colors.onPrimary,
      ),
    );
  }
}
