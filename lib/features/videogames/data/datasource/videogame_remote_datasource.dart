import 'package:gamingapp/features/videogames/data/models/videogame.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

abstract class VideoGameRemoteDataSource {
  Future<List<VideoGame>> getVideoGames();
  Future<void> addGames(VideoGame videoGame);
  Future<void> deleteGame(VideoGame videoGame);
  Future<void> updateGame(VideoGame videoGame);
}

class VideoGameRemoteDataSourceImpl implements VideoGameRemoteDataSource {
  String ip = '192.168.0.2:8000';

  @override
  Future<List<VideoGame>> getVideoGames() async {
    var url = Uri.http(ip, '/api/v1/videogame/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert
          .jsonDecode(response.body)
          .map<VideoGameModel>((data) => VideoGameModel.fromJson(data))
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> addGames(VideoGame videoGame) async {
    var url = Uri.http(ip, '/api/v1/videogame/');
    var body = {
      'name': videoGame.name,
      'releaseYear': videoGame.releaseYear,
      'developer': videoGame.developer,
      'genre': videoGame.genre
    };
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: headers);
  }

  @override
  Future<void> deleteGame(VideoGame videoGame) async {
    var url = Uri.http(ip, '/api/v1/videogame/${videoGame.id}');
    var response = await http.delete(url);
  }

  @override
  Future<void> updateGame(VideoGame videoGame) async {
    var url = Uri.http(ip, '/api/v1/videogame/${videoGame.id}');
    var body = {
      'name': videoGame.name,
      'releaseYear': videoGame.releaseYear,
      'developer': videoGame.developer,
      'genre': videoGame.genre
    };
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.put(url, body: convert.jsonEncode(body), headers: headers);
  }
}
