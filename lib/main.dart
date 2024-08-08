import 'package:flutter/material.dart';
import 'services/physics_service.dart';
import 'services/simulation_service.dart';
import 'widgets/simulation_view.dart';

void main() {
  final physicsService = PhysicsService();
  final simulationService = SimulationService(physicsService);

  runApp(SimulationApp(simulationService));
}

class SimulationApp extends StatelessWidget {
  final SimulationService simulationService;

  SimulationApp(this.simulationService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulation Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimulationView(simulationService),
    );
  }
}