import 'package:forge2d/forge2d.dart';
import 'package:flutter/material.dart';

class Entity {
  final Body body;
  final Paint paint;

  Entity(this.body, Color color)
      : paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;
}