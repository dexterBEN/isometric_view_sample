import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsometricMapBloc extends Bloc<IsometricMapEvent, IsometricMapState>{

  IsometricMapBloc() : super (MapInitial()){

    on<TileClicked>((event, emit) async {

      //menuBloc!.add(OpenMenu());
      print("Tile has been clicked ${event.tileId}");
      emit(TileSelected(event.tileId));
    });

    on<SelectRessource>((event, emit) async {
      print("Ressource select ${event.resource}");
      emit(CreateNewResource(event.resource));
    });
  }
}