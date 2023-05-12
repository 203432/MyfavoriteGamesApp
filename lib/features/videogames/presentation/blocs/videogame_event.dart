part of 'videogame_bloc.dart';

@immutable
abstract class VideoGameEvent {}

class GetVideoGame extends VideoGameEvent {}

class AddGames extends VideoGameEvent {
  final VideoGame videoGame;

  AddGames({required this.videoGame});
}

class DeleteGame extends VideoGameEvent {
  final VideoGame videoGame;

  DeleteGame({required this.videoGame});
}

class UpdateGame extends VideoGameEvent {
  final VideoGame videoGame;

  UpdateGame({required this.videoGame});
}