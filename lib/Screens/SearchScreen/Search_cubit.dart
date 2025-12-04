import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Screens/SearchScreen/Search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._apiManager) : super(InitialState());

  final ApiManager _apiManager;

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) return;

    emit(LoadingState());

    try {
      final response = await _apiManager.searchMovies(query);

      final movies = response.data?.movies ?? [];

      emit(SuccessState(movies));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
