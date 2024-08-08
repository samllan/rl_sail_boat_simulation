import 'package:forge2d/forge2d.dart';
import '../models/boat.dart';
import 'package:flutter/material.dart';

class PhysicsService {
  final World world;
  final List<Boat> boats = [];
  final Vector2 waterCurrent = Vector2(0.5, 0); // Example constant current

  PhysicsService() : world = World(Vector2(0, 0)); // No gravity

  void addBoat(Boat boat) {
    boats.add(boat);
  }

  void createSampleBoat() {
    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position.setValues(5, 5);

    final body = world.createBody(bodyDef);

    final boatShape = PolygonShape();
    boatShape.setAsBoxXY(1.0, 0.5); // Boat size

    final fixtureDef = FixtureDef(boatShape)
      ..density = 1.0
      ..friction = 0.3
      ..restitution = 0.8;

    body.createFixture(fixtureDef);

    addBoat(Boat(body, Colors.blue));
  }

  void stepSimulation(double timeStep) {
    for (var boat in boats) {
      // Apply water current as a force
      boat.body.applyForceToCenter(waterCurrent);

      // Check for boundary collisions and adjust position/velocity
      if (boat.body.position.x - 1 < 0 || boat.body.position.x + 1 > 10) {
        boat.body.linearVelocity.x *= -0.8; // Bounce back
      }
      if (boat.body.position.y - 0.5 < 0 || boat.body.position.y + 0.5 > 10) {
        boat.body.linearVelocity.y *= -0.8; // Bounce back
      }
    }

    world.stepDt(timeStep);
  }
}