import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'dart:math' as math;

class CurvePainter extends CustomPainter {
  CurvePainter(this.svg);

  final PictureInfo svg;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width,size.height);
    for (var i = 0; i < 20; i += 1) {
      int j = 0;
      if (i < 10) {
        j += 6;
      } else if (j < 20) {
        j -= 6;
      } else if (j < 30) {
        j += 6;
      } else {
        j -= 6;
      }      canvas.rotate((j) * (math.pi / 180));
            canvas.rotate((j) * (math.pi / 180));
      canvas.drawPicture(svg.picture);

      canvas.translate(-50, -50);
    }

    // canvas.drawLine(Offset(10, 10), Offset(10, 30), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
