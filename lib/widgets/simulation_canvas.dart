import 'package:flutter/material.dart';
import 'package:forge2d/forge2d.dart';
import '../services/physics_service.dart';
import '../models/entity.dart';

class SimulationCanvas extends StatelessWidget {
  final PhysicsService physicsService;

  SimulationCanvas(this.physicsService);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SimulationPainter(physicsService),
    );
  }
}

class _SimulationPainter extends CustomPainter {
  final PhysicsService physicsService;

  _SimulationPainter(this.physicsService);

  @override
  void paint(Canvas canvas, Size size) {
    for (Entity entity in physicsService.entities) {
      final Vector2 position = entity.body.position;
      canvas.drawCircle(
          Offset(position.x * 10, size.height - position.y * 10), 10, entity.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}