class MovieModel {
  final int id;
  final String title;
  final String summary;
  final double rating;
  final int year;
  final String posterUrl;
  final String backgroundUrl;
  final List<String> genres;
  final String ytTrailerCode;

  MovieModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.rating,
    required this.year,
    required this.posterUrl,
    required this.backgroundUrl,
    required this.genres,
    required this.ytTrailerCode,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      summary: json['summary'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      year: json['year'] ?? 0,
      posterUrl: json['medium_cover_image'] ?? '',
      backgroundUrl: json['background_image'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      ytTrailerCode: json['yt_trailer_code'] ?? '',
    );
  }
}