import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {}

class MenuClosed extends MenuState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MenuOpened extends MenuState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ElementSelected extends MenuState {
  //final Element element;
  ElementSelected();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}