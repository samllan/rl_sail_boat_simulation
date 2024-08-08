import 'package:forge2d/forge2d.dart';
import '../models/entity.dart';
import 'package:flutter/material.dart';

class PhysicsService {
  final World world;
  final List<Entity> entities = [];

  PhysicsService() : world = World(Vector2(0, -10)); // Example gravity

  void addEntity(Entity entity) {
    entities.add(entity);
  }

  void createSampleEntities() {
    // Define the body properties using BodyDef
    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position.setValues(0, 10);
    
    // Create the body in the world
    final body = world.createBody(bodyDef);
    
    // Define the shape and fixture
    final circleShape = CircleShape()..radius = 1.0;
    final fixtureDef = FixtureDef(circleShape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.8;
    
    // Attach the fixture to the body
    body.createFixture(fixtureDef);

    // Add the entity to the list
    addEntity(Entity(body, Colors.blue));
  }

  void stepSimulation(double timeStep) {
    world.stepDt(timeStep);
    // Update entities if necessary
  }
}