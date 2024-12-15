import 'package:equatable/equatable.dart';
import 'package:isomap_sample/domain/models/ressource.dart';

abstract class IsometricMapState extends Equatable {

  const IsometricMapState();

}

class MapInitial extends IsometricMapState {
  MapInitial();
  
  @override
  List<Object?> get props => [];
}

class TileSelected extends IsometricMapState {
  final int tileId;
  const TileSelected(this.tileId);
  
  @override
  List<Object?> get props => [tileId];
}

class ElementPlacedOnTile extends IsometricMapState {
  final int tileId;
  final Resource resource;
  const ElementPlacedOnTile(this.tileId, this.resource);
  
  @override
  List<Object?> get props => [tileId, resource];
}