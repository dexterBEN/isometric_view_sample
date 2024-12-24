import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {}

class MenuClosed extends MenuState {
  @override
  List<Object?> get props => [];
}

class MenuOpened extends MenuState {
  @override
  List<Object?> get props => [];
}

class ElementSelected extends MenuState {
  ElementSelected();
  
  @override
  List<Object?> get props => [];
}