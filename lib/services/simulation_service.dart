import 'package:flutter/widgets.dart';
import 'physics_service.dart';

class SimulationService extends ChangeNotifier {
  final PhysicsService physicsService;
  late AnimationController _controller;

  SimulationService(this.physicsService, TickerProvider vsync) {
    physicsService.createSampleEntities();
    _controller = AnimationController(vsync: vsync, duration: const Duration(days: 365))
      ..addListener(_tick)
      ..repeat();
  }

  void _tick() {
    physicsService.stepSimulation(1 / 60); // 60 FPS
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}