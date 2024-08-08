import 'package:flutter/foundation.dart'; // Import for ChangeNotifier
import 'package:flutter/scheduler.dart'; // Import for Ticker
import 'physics_service.dart';

class SimulationService extends ChangeNotifier {
  final PhysicsService physicsService;
  late Ticker _ticker;

  SimulationService(this.physicsService) {
    physicsService.createSampleEntities();
    _ticker = Ticker(_tick)..start();
  }

  void _tick(Duration elapsed) {
    physicsService.stepSimulation(1 / 60); // 60 FPS
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}