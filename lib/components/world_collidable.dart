import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class WordlCollidable extends PositionComponent
    with HasGameRef, Hitbox, Collidable {
  WordlCollidable() {
    addHitbox(HitboxRectangle());
  }
}
