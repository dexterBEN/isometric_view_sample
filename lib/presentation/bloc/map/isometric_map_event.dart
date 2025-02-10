import 'package:equatable/equatable.dart';
import 'package:isomap_sample/domain/models/resource.dart';

abstract class IsometricMapEvent extends Equatable {
  
  const IsometricMapEvent();
}

class TileClicked extends IsometricMapEvent {
  
  Map<String, int> resourcePosition;
  TileClicked(this.resourcePosition);
  
  @override
  List<Object?> get props => [resourcePosition];
}

class SelectRessource extends IsometricMapEvent {
  final String resource;
  const SelectRessource(this.resource) : super();
  
  @override
  List<Object?> get props => [resource];
}

class UpdateSelectedTileEvent extends IsometricMapEvent {
  final String imagePath;

  const UpdateSelectedTileEvent(this.imagePath) : super();
  
  @override
  List<Object?> get props => [imagePath];
}
