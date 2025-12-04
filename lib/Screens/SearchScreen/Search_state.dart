abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class SuccessState extends SearchState {
  final List movies;
  SuccessState(this.movies);
}

class ErrorState extends SearchState {
  final String message;
  ErrorState(this.message);
}
