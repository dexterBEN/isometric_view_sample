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

    List<Widget> menueElements = [];

    menueElements.addAll([
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text("Title"),
      ),
      ExpansionTile(
        title: Text("ressources"),
        children: List<ListTile>.generate(
          paths.length,
          (int index) {
            return ListTile(
              leading: Image.network(paths[index]),
              onTap: () {
                var isometricMapBloc = context.read<IsometricMapBloc>();
                isometricMapBloc.add(SelectRessource(paths[index]));
              },
            );
          },
        ),
      ),
      ExpansionTile(
        title: Text("other actions"),
        children: [
          ElevatedButton(onPressed: (){
            var isometricMapBloc = context.read<IsometricMapBloc>();
                isometricMapBloc.add(DeleteResource());
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            elevation: 0,
          ),
          child:Text("delete") ),
        ]
      )
    ]);

    return Drawer(
        child: ListView(children: menueElements, padding: EdgeInsets.zero));

    //BlocConsumer<IsometricMapBloc, IsometricMapState>(
    //   listener: (context, state) {

    //   },
    //   builder: (BuildContext context, IsometricMapState state) {
    //     return Container(
    //       width: 900,
    //       height: 80,
    //       decoration: BoxDecoration(
    //         color: Colors.grey.shade900.withOpacity(0.8),
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(5),
    //         ),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: List.generate(
    //           paths.length,
    //           (index) {
    //             return InkWell(
    //               child: Image.network(paths[index]),
    //               onTap: () {
    //                 final isometricMapBloc = context.read<IsometricMapBloc>();

    //                 isometricMapBloc.add(SelectRessource(paths[index]));
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
