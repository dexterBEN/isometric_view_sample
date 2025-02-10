import 'package:equatable/equatable.dart';
import 'package:isomap_sample/domain/models/resource.dart';

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
  final Map<String, int>? resourcePosition;
  const TileSelected(this.resourcePosition);
  
  @override
  List<Object> get props => [resourcePosition!];
}

class CreateNewResource extends IsometricMapState {
  final Resource resource;
  final Map<String, int>? resourcePosition;
  const CreateNewResource(this.resource, this.resourcePosition);
  
  @override
  List<Object> get props => [resource, resourcePosition!];
}