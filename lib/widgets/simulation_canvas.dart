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
    // Draw boundary
    Paint boundaryPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), boundaryPaint);

    // Draw boats
    for (Boat boat in physicsService.boats) {
      final Vector2 position = boat.body.position;
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset(position.x * 10, size.height - position.y * 10),
          width: 20,
          height: 10,
        ),
        boat.paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}