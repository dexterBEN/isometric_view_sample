import 'package:equatable/equatable.dart';

abstract class IsometricMapState extends Equatable {

  const IsometricMapState();
  @override
  List<Object> get props => [];
}

class MapInitial extends IsometricMapState {
  const MapInitial();
  
  @override
  List<Object> get props => [];
}

class TileSelected extends IsometricMapState {
  final int tileId;
  const TileSelected(this.tileId);
  
  @override
  List<Object> get props => [tileId];
}

class CreateNewResource extends IsometricMapState {
  final String resource;
  const CreateNewResource(this.resource);
  
  @override
  List<Object> get props => [resource];
}