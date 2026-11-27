class GameModel {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String genre;
  final String platform;
  final String releaseDate;

  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.genre,
    required this.platform,
    required this.releaseDate,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'] ?? 0,
      title: (json['title'] ?? '').toString(),
      thumbnail: (json['thumbnail'] ?? '').toString(),
      shortDescription: (json['short_description'] ?? '').toString(),
      genre: (json['genre'] ?? '').toString(),
      platform: (json['platform'] ?? '').toString(),
      releaseDate: (json['release_date'] ?? '').toString(),
    );
  }
}