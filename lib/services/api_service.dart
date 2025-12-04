import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://yts.mx/api/v2';

  Future<List<MovieModel>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  }) async {
    try {
      String url = '$baseUrl/list_movies.json?page=$page&limit=$limit';

      if (query != null && query.isNotEmpty) {
        url += '&query_term=$query';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['data']['movies'] != null) {
          List<dynamic> moviesJson = data['data']['movies'];
          return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    try {
      final url = '$baseUrl/movie_details.json?movie_id=$movieId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['data']['movie'] != null) {
          return MovieModel.fromJson(data['data']['movie']);
        }
      }
      return null;
    } catch (e) {
      print('Error fetching movie details: $e');
      return null;
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    return getMovies(query: query);
  }
}