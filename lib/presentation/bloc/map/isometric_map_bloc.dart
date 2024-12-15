import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isomap_sample/presentation/bloc/menue/menu_bloc.dart';

class IsometricMapBloc extends Bloc<IsometricMapEvent, IsometricMapState>{
  //final MenuBloc? menuBloc;

  IsometricMapBloc({MenuBloc? menuBloc}) : super ( MapInitial()){

    on<TileClicked>((event, emit) async {

      //menuBloc!.add(OpenMenu());
      print("Tile has been clicked ${event.tileId}");
      emit(TileSelected(event.tileId));
    });

    on<PlaceElementOnTile>((event, emit) {
      emit(ElementPlacedOnTile(event.tileId, event.resource));
    });
  }
}