import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/videogames/presentation/blocs/videogame_bloc.dart';
import 'package:gamingapp/features/videogames/presentation/pages/create_videogame.dart';
import 'package:gamingapp/features/videogames/presentation/pages/update_videogame.dart';

class VideoGamePage extends StatefulWidget {
  const VideoGamePage({super.key});

  @override
  State<VideoGamePage> createState() => _VideoGamePageState();
}

class _VideoGamePageState extends State<VideoGamePage> {
  @override
  void initState() {
    super.initState();
    context.read<VideoGameBloc>().add(GetVideoGame());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateVideogame()),
          );
        },
      ),
      appBar: AppBar(
        title: Text('Juegos'),
      ),
      body:
          BlocBuilder<VideoGameBloc, VideoGameState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return SingleChildScrollView(
            child: Column(
                children: state.videogame.map((videogame) {
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                color: Colors.black12,
                child: ListTile(
                  leading: Text(videogame.id.toString()),
                  title: Row(
                    children: [
                      Text(videogame.name),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
 Navigator.push(
            context,
            MaterialPageRoute(builder: (_) =>  UpdateVideoGame(videoGame: videogame,)),
          );
                          // Lógica de edición aquí
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Confirmación',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                      '¿Está seguro de que desea eliminar ${videogame.name}?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color:
                                                Colors.red), // borde del botón
                                        backgroundColor: Colors
                                            .red, // color de fondo del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        'Eliminar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        BlocProvider.of<VideoGamesBlocModify>(
                                                context)
                                            .add(DeleteGame(
                                                videoGame: videogame));
                                        Navigator.of(context).pop();
                                        await Future.delayed(const Duration(
                                                milliseconds: 95))
                                            .then((value) =>
                                                BlocProvider.of<VideoGameBloc>(
                                                        context)
                                                    .add(GetVideoGame()));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(videogame.developer),
                      SizedBox(
                          width:
                              8), // Agrega un espacio en blanco entre los iconos y el texto
                    ],
                  ),
                ),
              );
            }).toList()),
          );
        } else if (state is Error) {
          return Center(
            child: Text(state.error, style: const TextStyle(color: Colors.red)),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
