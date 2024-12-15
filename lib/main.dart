import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:isomap_sample/presentation/bloc/map/IsometricMapBloc.dart';
import 'package:isomap_sample/presentation/bloc/map/IsometricMapState.dart';

import 'presentation/widgets/tile_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(
    GameWidget(game: IsometricGame()),
  );
}

class IsometricGame extends FlameGame {
  static const int rows = 5; // Nombre de lignes
  static const int columns = 5; // Nombre de colonnes
  final double tileSize = 64.0; // Taille de chaque tuile

  double get startX => (size.x - (columns * tileSize)) / 2;
  double get startY => (size.y - (rows * tileSize)) / 2;

  @override
  Future<void> onLoad() async {
    //await super.onLoad();

    List<TileComponent> tiles = [];

    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        final int tileId = row * columns + column;
        final double x = startX + (column - row) * (tileSize / 2);
        final double y = startY + (row + column) * (tileSize / 4);

        print("tile id:${tileId}");

        final tile = TileComponent(
          position: Vector2(x, y),
          size: Vector2(tileSize, tileSize / 2),
          tileId: tileId
        );
        
        tiles.add(tile);
      }
    }

    //Ajouter les providers à l'arborescence des composants
    final providers = FlameMultiBlocProvider(
      providers: [
        FlameBlocProvider<IsometricMapBloc, IsometricMapState>(
          create: () => IsometricMapBloc(),
          children: tiles
        ),
      ],
    );
    await add(providers); // Les providers doivent être ajoutés en premier

    // Ajouter les tuiles après les providers
    
  }
}


