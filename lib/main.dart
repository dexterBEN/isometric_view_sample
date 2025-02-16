import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_bloc.dart';
import 'package:isomap_sample/presentation/widgets/isometric_game.dart';
import 'package:isomap_sample/presentation/widgets/menu_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  var blocInstance = IsometricMapBloc(rows: 5,columns: 5);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<IsometricMapBloc>(
          create: (context) => blocInstance,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(automaticallyImplyLeading: true,),
          body: GameWidget(game: IsometricGame(isometricMapBloc: blocInstance)),
          drawer: MenuWidget(),
          // Stack(
          //   children: [
          //     GameWidget(game: IsometricGame(isometricMapBloc: blocInstance)),
          //     Positioned(
          //       right: 550,
          //       bottom: 50,
          //       child: MenuWidget(), // Menu Flutter
          //     ),
          //   ],
          // ),
        ),
      ),
    ),
  );
}
