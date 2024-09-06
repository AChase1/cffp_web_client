import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isSelected
            ? Container(
                height: 80.0,
                width: 120.0,
                decoration: containerDecoration(context: context),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelected = false;
                          });
                          context.goNamed(loginRouteName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                            "Logout",
                            style: context.fonts.bodyLarge?.copyWith(
                              color: context.colors.error,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            width: 120.0,
            height: 35.0,
            decoration: containerDecoration(context: context),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Name",
                style: context.fonts.bodyLarge?.copyWith(
                  fontSize: 20.0,
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}