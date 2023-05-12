import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/domain/usecases/add_videogame_usecase.dart';
import 'package:gamingapp/features/videogames/presentation/blocs/videogame_bloc.dart';
import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';

class CreateVideogame extends StatefulWidget {
  const CreateVideogame({super.key});

  @override
  State<CreateVideogame> createState() => _CreateVideogameState();
}

class _CreateVideogameState extends State<CreateVideogame> {
  TextEditingController _nameGame = TextEditingController();
  TextEditingController _realeaseYearGame = TextEditingController();
  TextEditingController _developerGame = TextEditingController();
  TextEditingController _genreGame = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrega un nuevo juego'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _nameGame,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "NOMBRE",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _realeaseYearGame,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "Año de salida",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _developerGame,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "Desarrolladora",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _genreGame,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "Genero",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 117, 203, 88),
                          onPressed: () async {
                            var videoGame = VideoGame(
                                id: 0,
                                name: _nameGame.text,
                                releaseYear: int.parse(_realeaseYearGame.text),
                                developer: _developerGame.text,
                                genre: _genreGame.text);
                            BlocProvider.of<VideoGamesBlocModify>(context)
                                .add(AddGames(videoGame: videoGame));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'Crear',
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 117, 203, 88),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoGamePage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'REGRESAR',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
