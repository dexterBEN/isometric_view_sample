import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:isomap_sample/presentation/widgets/tile_component.dart';

class IsometricGame extends FlameGame {
  final double tileSize = 64.0; // Taille de chaque tuile
  final List<TileComponent> tiles = [];

  IsometricMapBloc isometricMapBloc;
  double get startX => (size.x - (isometricMapBloc.columns * tileSize)) / 2;
  double get startY => (size.y - (isometricMapBloc.rows * tileSize)) / 2;

  IsometricGame({required this.isometricMapBloc});

  @override
  Future<void> onLoad() async {
    for (int row = 0; row < isometricMapBloc.rows; row++) {
      for (int column = 0; column < isometricMapBloc.columns; column++) {
        final double x = startX + (column - row) * (tileSize / 2);
        final double y = startY + (row + column) * (tileSize / 4);

        final tile = TileComponent(
          position: Vector2(x, y),
          size: Vector2(tileSize, tileSize / 2),
          resourcePosition: {"x": row, "y": column}
        );

        //isometricMapBloc.resourceList[row][column] = null;

        //print("${row.toDouble()} / ${column.toDouble()}");
        print("$row / $column");

        tiles.add(tile);
      }
    }

    print(isometricMapBloc.resourceList);

    final providers = FlameMultiBlocProvider(providers: [
      FlameBlocProvider<IsometricMapBloc, IsometricMapState>.value(
        value: isometricMapBloc,
      ),
    ], children: tiles);

    await add(providers);
  }

  
}
