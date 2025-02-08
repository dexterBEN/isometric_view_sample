import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:isomap_sample/presentation/widgets/tile_component.dart';

class IsometricGame extends FlameGame {
  static const int rows = 5; // Nombre de lignes
  static const int columns = 5; // Nombre de colonnes
  final double tileSize = 64.0; // Taille de chaque tuile
  final List<TileComponent> tiles = [];

  double get startX => (size.x - (columns * tileSize)) / 2;
  double get startY => (size.y - (rows * tileSize)) / 2;

  IsometricMapBloc isometricMapBloc;

  IsometricGame({required this.isometricMapBloc});

  @override
  Future<void> onLoad() async {
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        final int tileId = row * columns + column;
        final double x = startX + (column - row) * (tileSize / 2);
        final double y = startY + (row + column) * (tileSize / 4);

        final tile = TileComponent(
          position: Vector2(x, y),
          size: Vector2(tileSize, tileSize / 2),
          tileId: tileId,
        );

        isometricMapBloc.resources?[row][column] = null;

        tiles.add(tile);
      }
    }

    final providers = FlameMultiBlocProvider(providers: [
      FlameBlocProvider<IsometricMapBloc, IsometricMapState>.value(
        value: isometricMapBloc,
      ),
    ], children: tiles);

    await add(providers);
  }
}
