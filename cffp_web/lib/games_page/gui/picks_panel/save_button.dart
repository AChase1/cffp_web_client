import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: containerDecoration(
                  context: context, color: context.colors.secondaryContainer),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "SAVE",
                    style: context.fonts.headlineSmall
                        ?.copyWith(color: context.colors.primary),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
