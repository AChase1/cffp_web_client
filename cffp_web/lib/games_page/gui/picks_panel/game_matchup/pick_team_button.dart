import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/clipper_decoration.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';

class PickTeamButton extends StatefulWidget {
  final Function() onClick;
  final Map<dynamic, dynamic> team;
  final bool isHome;
  final bool isSelected;
  const PickTeamButton({
    super.key,
    required this.team,
    required this.isHome,
    required this.onClick,
    required this.isSelected,
  });

  @override
  State<PickTeamButton> createState() => _PickTeamButtonState();
}

class _PickTeamButtonState extends State<PickTeamButton>
    with SingleTickerProviderStateMixin {
  late double _colorBackgroundWidth;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 20.0, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _colorBackgroundWidth = widget.isSelected ? 190.0 : 50.0;
    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    print("animation value ==> ${_animation.value}");
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Stack(
        children: [
          Container(
            decoration: containerDecoration(context: context),
          ),
          Align(
            alignment:
                widget.isHome ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return ClipPath(
                  clipper: widget.isHome
                      ? ContainerFullHomeClipper(sizeOfClip: _animation.value)
                      : ContainerFullAwayClipper(sizeOfClip: _animation.value),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: _colorBackgroundWidth,
                    curve: Curves.easeOut,
                    height: 65.0,
                    color: widget.team["primaryColor"] as Color,
                    child: Stack(children: [
                      widget.isHome
                          ? Positioned(
                              right: -40.0,
                              top: -17.0,
                              child: Opacity(
                                opacity: widget.isSelected ? 1.0 : 0.3,
                                child: Transform.flip(
                                  flipX: true,
                                  child: Image.asset(
                                    //alignment: Alignment.centerLeft,
                                    height: 100.0,
                                    width: 100.0,
                                    widget.team["logo"],
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              left: -40.0,
                              top: -15.0,
                              child: Opacity(
                                opacity: widget.isSelected ? 1.0 : 0.3,
                                child: Image.asset(
                                  //alignment: Alignment.centerLeft,
                                  height: 100.0,
                                  width: 100.0,
                                  widget.team["logo"],
                                ),
                              ),
                            ),
                    ]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: widget.isHome
                ? const EdgeInsets.only(right: 80.0, top: 10.0, bottom: 10.0)
                : const EdgeInsets.only(left: 80.0, top: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Align(
                  alignment: widget.isHome
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    textAlign: widget.isHome ? TextAlign.right : TextAlign.left,
                    "${widget.team["city"]}",
                    style: context.fonts.bodyLarge?.copyWith(
                      fontSize: 13.0,
                      color: widget.isSelected
                          ? widget.team["onPrimaryColor"]
                          : context.colors.onPrimary,
                    ),
                  ),
                ),
                Align(
                  alignment: widget.isHome
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    textAlign: widget.isHome ? TextAlign.right : TextAlign.left,
                    "${widget.team["name"]}",
                    style: context.fonts.headlineSmall?.copyWith(
                      color: widget.isSelected
                          ? widget.team["onPrimaryColor"]
                          : context.colors.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}