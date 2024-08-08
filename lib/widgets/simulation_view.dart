import 'package:flutter/material.dart';
import '../services/simulation_service.dart';
import 'simulation_canvas.dart';

class SimulationView extends StatelessWidget {
  final SimulationService simulationService;

  SimulationView(this.simulationService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulation View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SimulationCanvas(simulationService.physicsService),
            ),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Text('Controls Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}