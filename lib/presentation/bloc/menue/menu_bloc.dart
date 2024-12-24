import 'package:isomap_sample/presentation/bloc/menue/menu_event.dart';
import 'package:isomap_sample/presentation/bloc/menue/menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuClosed()) {
    on<OpenMenu>((event, emit) => emit(MenuOpened()));
    on<RessourceSelected>((event, emit) => emit(ElementSelected()));
  }
}