import '../models/entity.dart';
import 'package:flutter/material.dart';

class PhysicsService {
  final World world;
  final List<Entity> entities = [];

  PhysicsService() : world = World(Vector2(0, -10)); // Example gravity

  void addEntity(Entity entity) {
    entities.add(entity);
    world.createBody(entity.body); // This is correct, as long as entity.body is of type BodyDef
  }

  void createSampleEntities() {
    // Example entity creation
    final circleShape = CircleShape()..radius = 1.0;
    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position.setValues(0, 10);
    final fixtureDef = FixtureDef(circleShape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.8;
    
    final body = world.createBody(bodyDef)..createFixture(fixtureDef);
    addEntity(Entity(body, Colors.blue));
  }

  void stepSimulation(double timeStep) {
    world.stepDt(timeStep);
    // Update entities if necessary
  }
}