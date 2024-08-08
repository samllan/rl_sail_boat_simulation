import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/simulation_service.dart';
import 'services/physics_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RL Sail Boat Simulation'),
        ),
        body: SimulationScreen(),
      ),
    );
  }
}

class SimulationScreen extends StatelessWidget {
  final SimulationService simulationService = SimulationService(PhysicsService());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => simulationService,
      child: Consumer<SimulationService>(
        builder: (context, simulationService, child) {
          return CustomPaint(
            painter: SimulationPainter(simulationService.physicsService.entities),
          );
        },
      ),
    );
  }
}

class SimulationPainter extends CustomPainter {
  final List<Entity> entities;

  SimulationPainter(this.entities);

  @override
  void paint(Canvas canvas, Size size) {
    for (var entity in entities) {
      // Paint each entity
      canvas.drawCircle(
        Offset(entity.body.position.x * size.width, size.height - entity.body.position.y * size.height),
        10.0, // Example radius
        entity.paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}