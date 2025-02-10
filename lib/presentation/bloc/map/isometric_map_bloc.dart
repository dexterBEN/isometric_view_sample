import 'package:isomap_sample/domain/models/resource.dart';
import 'package:isomap_sample/domain/models/resource_map.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsometricMapBloc extends Bloc<IsometricMapEvent, IsometricMapState>{
  final int rows;
  final int columns;
  late List<List<Resource?>> resourceList;
  Map<String, int>? selectedTile;

  IsometricMapBloc({required this.rows, required this.columns}) : super (MapInitial()){

    resourceList = List.generate(rows, (_) => List.generate(columns, (_) => null));

    on<TileClicked>((event, emit) async {

      //menuBloc!.add(OpenMenu());
      print("Position selected:${event.resourcePosition["x"]} / ${event.resourcePosition["y"]}");
      selectedTile = event.resourcePosition;
      emit(TileSelected(event.resourcePosition));
    });

    on<SelectRessource>((event, emit) async {
      print("Ressource select ${event.resource}");

      if(selectedTile != null) 
      {
        final newResource = Resource(id: 4556654, iconPath: event.resource);
        resourceList[selectedTile!["x"]!][selectedTile!["y"]!] = Resource(id: 4556654, iconPath: event.resource);
        emit(CreateNewResource(newResource, selectedTile));
        print("-------------->$resourceList");
        selectedTile = null;
      }
    });
  }
}