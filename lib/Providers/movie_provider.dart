import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<MovieModel> _movies = [];
  List<MovieModel> _searchResults = [];
  bool _isLoading = false;
  String _error = '';

  List<MovieModel> get movies => _movies;
  List<MovieModel> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchMovies({int page = 1}) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _movies = await _apiService.getMovies(page: page);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load movies';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      _searchResults = await _apiService.searchMovies(query);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to search movies';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    try {
      return await _apiService.getMovieDetails(movieId);
    } catch (e) {
      return null;
    }
  }

  void clearSearch() {
    _searchResults = [];
    notifyListeners();
  }
}