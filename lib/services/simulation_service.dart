import 'dart:async';
import 'package:flutter/widgets.dart';
import 'physics_service.dart';

class SimulationService extends ChangeNotifier {
  final PhysicsService physicsService;
  late Timer _timer;

  SimulationService(this.physicsService) {
    physicsService.createSampleBoat();
    _startSimulation();
  }

  void _startSimulation() {
    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      _tick();
    });
  }

  void _tick() {
    physicsService.stepSimulation(1 / 60); // 60 FPS
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}