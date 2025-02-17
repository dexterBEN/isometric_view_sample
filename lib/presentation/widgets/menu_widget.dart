import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_bloc.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_event.dart';
import 'package:isomap_sample/presentation/bloc/map/isometric_map_state.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accéder au bloc ou à d'autres données nécessaires

    List<String> paths = [
      "../../../assets/blocks_1.png",
      "../../../assets/blocks_2.png",
      "../../../assets/blocks_3.png",
      "../../../assets/blocks_4.png",
      "../../../assets/blocks_5.png",
      "../../../assets/blocks_6.png",
      "../../../assets/blocks_7.png"
    ];

    return BlocConsumer<IsometricMapBloc, IsometricMapState>(
      listener: (context, state) {
  
      },
      builder: (BuildContext context, IsometricMapState state) {
        return Container(
          width: 900,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              paths.length,
              (index) {
                return InkWell(
                  child: Image.network(paths[index]),
                  onTap: () {
                    final isometricMapBloc = context.read<IsometricMapBloc>();

                    isometricMapBloc.add(SelectRessource(paths[index]));
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
