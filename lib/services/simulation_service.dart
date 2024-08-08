import 'package:flutter/widgets.dart';
import 'physics_service.dart';

class SimulationService extends ChangeNotifier with TickerProviderStateMixin {
  final PhysicsService physicsService;
  Ticker _ticker;

  SimulationService(this.physicsService) {
    physicsService.createSampleEntities(); // Add this line
    _ticker = createTicker(_tick)..start();
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