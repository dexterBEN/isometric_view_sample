import 'package:equatable/equatable.dart';
import 'package:isomap_sample/domain/models/resource.dart';

abstract class IsometricMapEvent extends Equatable {
  final int tileId;
  const IsometricMapEvent(this.tileId);
}

class TileClicked extends IsometricMapEvent {
  
  const TileClicked(super.tileId);
  
  @override
  List<Object?> get props => [tileId];
}

class SelectRessource extends IsometricMapEvent {
  final String resource;
  const SelectRessource(this.resource) : super(0);
  
  @override
  List<Object?> get props => [resource];
}

class UpdateSelectedTileEvent extends IsometricMapEvent {
  final String imagePath;

  const UpdateSelectedTileEvent(this.imagePath) : super(0);
  
  @override
  List<Object?> get props => [imagePath];
}
