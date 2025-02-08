import 'package:isomap_sample/domain/models/resource.dart';
import 'package:isomap_sample/domain/models/resource_map.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsometricMapBloc extends Bloc<IsometricMapEvent, IsometricMapState>{

  List<List<RessourceMap?>>? resources;
  IsometricMapBloc({this.resources}) : super (MapInitial()){

    on<TileClicked>((event, emit) async {

      //menuBloc!.add(OpenMenu());
      print("Tile has been clicked ${event.tileId}");
      emit(TileSelected(event.tileId));
    });

    on<SelectRessource>((event, emit) async {
      print("Ressource select ${event.resource}");
      final newResource = Resource(id: 4556654, iconPath: event.resource);
      emit(CreateNewResource(newResource));
    });
  }
}