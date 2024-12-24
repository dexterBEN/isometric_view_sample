import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MenuEvent extends Equatable {}

class OpenMenu extends MenuEvent {
  @override
  List<Object?> get props => [];
}

class RessourceSelected extends MenuEvent {
  final String imagePath;

  RessourceSelected(this.imagePath);
  
  @override
  List<Object?> get props => [imageCache];
}