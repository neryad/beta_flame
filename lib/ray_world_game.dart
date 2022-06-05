import 'dart:ui';

import 'package:flame/game.dart';
import 'package:rayworld/components/player.dart';
import 'package:rayworld/components/world.dart';
import 'package:rayworld/components/world_collidable.dart';
import 'package:rayworld/helpers/map_loader.dart';

import 'helpers/direction.dart';

final Player _player = Player();
final World _world = World();

class RayWorldGame extends FlameGame with HasCollidables {
  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);
    addWorldCollision();
    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    print(direction);
    _player.direction = direction;
  }

  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((react) {
        add(WordlCollidable()
          ..position = Vector2(react.left, react.top)
          ..width = react.width
          ..height = react.height);
      });
}
