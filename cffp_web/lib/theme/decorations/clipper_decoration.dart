import 'package:flutter/material.dart';

class ContainerLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ContainerLeftClipper oldClipper) => false;
}

class ContainerRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(20, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ContainerRightClipper oldClipper) => false;
}

class ContainerFullHomeClipper extends CustomClipper<Path> {
  double sizeOfClip;

  ContainerFullHomeClipper({required this.sizeOfClip});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(sizeOfClip, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ContainerFullHomeClipper oldClipper) => false;
}

class ContainerFullAwayClipper extends CustomClipper<Path> {
  double sizeOfClip;

  ContainerFullAwayClipper({required this.sizeOfClip});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width - sizeOfClip, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ContainerFullAwayClipper oldClipper) => false;
}
