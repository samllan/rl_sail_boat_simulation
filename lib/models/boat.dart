import 'package:forge2d/forge2d.dart';
import 'package:flutter/material.dart';

class Boat {
  final Body body;
  final Paint paint;

  Boat(this.body, Color color)
      : paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;
}