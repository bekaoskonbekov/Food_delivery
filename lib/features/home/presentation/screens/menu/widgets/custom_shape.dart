import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0355000, size.height * 0.4049000);
    path0.cubicTo(
        size.width * 0.3196000,
        size.height * 0.1190000,
        size.width * 0.2994000,
        size.height * 0.1249000,
        size.width * 0.4009000,
        size.height * 0.0237000);
    path0.cubicTo(
        size.width * 0.4300000,
        size.height * -0.0065000,
        size.width * 0.5601000,
        size.height * -0.0114000,
        size.width * 0.5953000,
        size.height * 0.0270000);
    path0.cubicTo(
        size.width * 0.6959000,
        size.height * 0.1213000,
        size.width * 0.8654000,
        size.height * 0.3046000,
        size.width * 0.9589000,
        size.height * 0.3989000);
    path0.cubicTo(
        size.width * 0.9956000,
        size.height * 0.4434000,
        size.width * 1.0019000,
        size.height * 0.5541000,
        size.width * 0.9665000,
        size.height * 0.5889000);
    path0.cubicTo(
        size.width * 0.8733000,
        size.height * 0.6917000,
        size.width * 0.6958000,
        size.height * 0.8652000,
        size.width * 0.6042000,
        size.height * 0.9622000);
    path0.cubicTo(
        size.width * 0.5749000,
        size.height * 1.0084000,
        size.width * 0.4493000,
        size.height * 1.0078000,
        size.width * 0.4116000,
        size.height * 0.9538000);
    path0.cubicTo(
        size.width * 0.3165000,
        size.height * 0.8567000,
        size.width * 0.1406000,
        size.height * 0.6850000,
        size.width * 0.0356000,
        size.height * 0.5800000);
    path0.cubicTo(
        size.width * 0.0006000,
        size.height * 0.5532000,
        size.width * 0.0007000,
        size.height * 0.4424000,
        size.width * 0.0355000,
        size.height * 0.4049000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
