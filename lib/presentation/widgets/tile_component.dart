import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:isomap_sample/presentation/bloc/map/IsometricMapBloc.dart';
import 'package:isomap_sample/presentation/bloc/map/IsometricMapEvent.dart';
import 'package:isomap_sample/presentation/bloc/map/IsometricMapState.dart';


class TileComponent extends PositionComponent with TapCallbacks, FlameBlocListenable<IsometricMapBloc, IsometricMapState>{
  final Paint _borderPaint = Paint();
  bool _isHovered = false;
  final int tileId;

  
  TileComponent({Vector2? position, Vector2? size, required this.tileId}) {
    this.position = position!;
    this.size = size!;
  }

  @override
  void onTapDown(TapDownEvent event) {
    _isHovered = !_isHovered;
    // Exemple : émettre un événement au `Bloc` lors d'un tap
    bloc.add(TileClicked(tileId));
  }

  @override
  void render(Canvas canvas) {
    // Dessiner une tuile isométrique (parallélogramme vide)
    final path = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(size.x, size.y / 2)
      ..lineTo(size.x / 2, size.y)
      ..lineTo(0, size.y / 2)
      ..close();

    _borderPaint.color = _isHovered ? Colors.yellow : Colors.white;
    canvas.drawPath(path, _borderPaint);
  }

  @override
  void onNewState(IsometricMapState state) {
    // Logique de réaction aux changements d'état du bloc
    // Exemple : changer la couleur de la tuile en fonction de l'état
    if (state is TileSelected && state.tileId == tileId) {
      _isHovered = true;
    } else {
      _isHovered = false;
    }
    _borderPaint.color = _isHovered ? Colors.yellow : Colors.white;
  }

  @override
  bool listenWhen(IsometricMapState previousState, IsometricMapState newState) {
    // Contrôle de l'écoute des états (facultatif)
    return true;
  }
}