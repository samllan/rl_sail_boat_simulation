import 'package:flutter/material.dart';
import 'services/physics_service.dart';
import 'services/simulation_service.dart';
import 'widgets/simulation_view.dart';

void main() {
  runApp(SimulationApp());
}

class SimulationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulation Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimulationHomePage(),
    );
  }
}

class SimulationHomePage extends StatefulWidget {
  @override
  _SimulationHomePageState createState() => _SimulationHomePageState();
}

class _SimulationHomePageState extends State<SimulationHomePage> with SingleTickerProviderStateMixin {
  late PhysicsService _physicsService;
  late SimulationService _simulationService;

  @override
  void initState() {
    super.initState();
    _physicsService = PhysicsService();
    _simulationService = SimulationService(_physicsService, this);
  }

  @override
  void dispose() {
    _simulationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimulationView(_simulationService);
  }
}