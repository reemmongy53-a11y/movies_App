import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/moviesDetials/DetialsResponces.dart';
import 'package:movies_app/models/listMovies/SourcesResponses.dart';

import '../models/MoviesSuggestions/SuggestionsResponces.dart';

class ApiManager {
  static const String _baseUrl = "yts.lt";
  static const String _sourceApi = "/api/v2/list_movies.json";
  static const String _baseUrl2 = "yts.lt";
  static const String _sourceApi2 = "/api/v2/movie_details.json";
  static const String _baseUrl3 = "yts.lt";
  static const String _sourceApi3 = "/api/v2/movie_suggestions.json";

  ApiManager._();
  static ApiManager? _instence;

  static ApiManager getInstence() {
    if (_instence == null) {
      _instence = ApiManager._();
    }
    return _instence!;
  }
  Future<SourcesResponses> searchMovies(String query) async {
    var params = {
      "query_term": query,
    };

    var uri = Uri.https(_baseUrl, _sourceApi, params);

    var response = await http.get(uri);

    print("Status Code: ${response.statusCode}");
    print("Body: ${response.body}");

    var json = jsonDecode(response.body);
    SourcesResponses sourcesResponses = SourcesResponses.fromJson(json);
    return sourcesResponses;
  }


  Future<SourcesResponses> getMoviesSources() async {
    var uri = Uri.https(_baseUrl, _sourceApi);

    var response = await http.get(uri);
    print(response.body);
    print("Status Code: ${response.statusCode}");
    var json = jsonDecode(response.body);
    SourcesResponses sourcesResponses = SourcesResponses.fromJson(json);
    return sourcesResponses;
  }

//https://yts.lt/api/v2/movie_details.json?movie_id=15&with_images=true&with_cast=true
  Future<DetialsResponces> getDetials(String movie_id) async {
    var params = {
      "movie_id": movie_id,
      "with_images": "true",
      "with_cast": "true",
    };

    var uri = Uri.https(_baseUrl2, _sourceApi2, params);

    var response = await http.get(uri);

    print("Status Code: ${response.statusCode}");
    print("Body: ${response.body}");

    var json = jsonDecode(response.body);
    DetialsResponces detialsResponces = DetialsResponces.fromJson(json);
    return detialsResponces;
  }

//https://yts.lt/api/v2/movie_suggestions.json?movie_id=10
  Future<SuggestionsResponces> getSuggestions(String movie_id) async {
    var params = {
      "movie_id": movie_id,
    };

    var uri = Uri.https(_baseUrl3, _sourceApi3, params);

    var response = await http.get(uri);

    print("Status Code: ${response.statusCode}");
    print("Body: ${response.body}");

    var json = jsonDecode(response.body);
    SuggestionsResponces suggestionsResponces =
        SuggestionsResponces.fromJson(json);
    return suggestionsResponces;
  }
}
