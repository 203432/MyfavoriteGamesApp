class VideoGame {
  int id;
  String name;
  String releaseYear;
  String developer;
  String genre;

  VideoGame(
      {required this.id,
      required this.name,
      required this.releaseYear,
      required this.developer,
      required this.genre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'releaseYear': releaseYear,
      'developer': developer,
      'genre': genre
    };
  }

  static VideoGame fromMap(Map<String, dynamic> map) {
    return VideoGame(
      id: map['id'],
      name: map['name'],
      releaseYear: map['releaseYear'],
      developer: map['developer'],
      genre: map['genre'],
    );
  }
}
