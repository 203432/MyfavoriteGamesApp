import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';

class VideoGameModel extends VideoGame {
  VideoGameModel(
      {required int id,
      required String name,
      required int releaseYear,
      required String developer,
      required String genre})
      : super(
            id: id,
            name: name,
            releaseYear: releaseYear,
            developer: developer,
            genre: genre);

  factory VideoGameModel.fromJson(Map<String, dynamic> json) {
    return VideoGameModel(
        id: json['id'],
        name: json['name'],
        releaseYear: json['releaseYear'],
        developer: json['developer'],
        genre: json['genre']);
  }

    factory VideoGameModel.fromEntity(VideoGame videogame) {
    return VideoGameModel(
      id: videogame.id,
      name: videogame.name,
      releaseYear: videogame.releaseYear,
      developer: videogame.developer,
      genre: videogame.genre
    );
  }
}
