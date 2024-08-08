import 'package:forge2d/forge2d.dart';
import '../models/entity.dart';

class PhysicsService {
  final World world;
  final List<Entity> entities = [];

  PhysicsService() : world = World(Vector2(0, -10)); // Example gravity

  void addEntity(Entity entity) {
    entities.add(entity);
    world.createBody(entity.body);
  }

  void stepSimulation(double timeStep) {
    world.stepDt(timeStep);
    // Update entities if necessary
  }
}