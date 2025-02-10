import 'dart:async';
import 'dart:ui' as dartui;


import 'package:flame/cache.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';


class TileComponent extends PositionComponent with TapCallbacks, FlameBlocListenable<IsometricMapBloc, IsometricMapState> {
  final Paint _borderPaint = Paint();
  bool _isHovered = false;
  String? resourceImagePath;
  Map<String, int> resourcePosition;
  late dartui.Image? tileImage;

  
  TileComponent({Vector2? position, Vector2? size, required this.resourcePosition}) {
    this.position = position!;
    this.size = size!;

    tileImage = null;
  }

  @override
  void onTapDown(TapDownEvent event) {
    _isHovered = !_isHovered;
    // Exemple : émettre un événement au Bloc lors d'un tap
    bloc.add(TileClicked(resourcePosition));
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
    
    
    if (tileImage != null) {
      placeRessourceOnTile(path, canvas);
    }
    
  }

  @override
  void onNewState(IsometricMapState state) async {

    if (state is TileSelected && state.resourcePosition!["x"] == resourcePosition["x"] && state.resourcePosition!["y"] == resourcePosition["y"]) {
      _isHovered = true;
    } 

    if (state is CreateNewResource && _isHovered) {
      resourceImagePath = state.resource.iconPath;
      tileImage = await Flame.images.load(resourceImagePath!);
      _isHovered = false;
    }
  }

  @override
  bool listenWhen(IsometricMapState previousState, IsometricMapState newState) {
    // Contrôle de l'écoute des états (facultatif)
    
    if(newState is TileSelected && newState.resourcePosition!["x"] == resourcePosition["x"] && newState.resourcePosition!["y"] == resourcePosition["y"]) {
      return true;
    }

    if (newState is CreateNewResource && _isHovered) {
      return true;
    }

    return false;
  }

  placeRessourceOnTile(Path path, Canvas canvas) {
    final bounds = path.getBounds();
    final centerX = bounds.center.dx;
    final centerY = bounds.center.dy;
    
    final imageWidth = tileImage!.width.toDouble();
    final imageHeight = tileImage!.height.toDouble();

    final offsetX = (centerX - (imageWidth / 8)) - 24;
    final offsetY = (centerY - (imageHeight / 2)) - 18;
    canvas.drawImage(tileImage!, Offset(offsetX, offsetY), _borderPaint);
    
  }
}