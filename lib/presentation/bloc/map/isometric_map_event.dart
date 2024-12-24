import 'package:equatable/equatable.dart';
import 'package:isomap_sample/domain/models/ressource.dart';

abstract class IsometricMapEvent extends Equatable {

  const IsometricMapEvent();
}

class TileClicked extends IsometricMapEvent {
  final int tileId;
  const TileClicked(this.tileId);
  
  @override
  List<Object?> get props => [tileId];
}

class PlaceElementOnTile extends IsometricMapEvent {
  final int tileId;
  final Resource resource;
  const PlaceElementOnTile(this.tileId, this.resource);
  
  @override
  List<Object?> get props => [tileId, resource];
}

class UpdateSelectedTileEvent extends IsometricMapEvent {
  final String imagePath;

  const UpdateSelectedTileEvent(this.imagePath);
  
  @override
  List<Object?> get props => [imagePath];
}
