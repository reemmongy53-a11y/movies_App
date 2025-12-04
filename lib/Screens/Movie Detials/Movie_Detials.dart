import 'package:flutter/material.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Screens/Movie Detials/Screen Shots.dart';
import 'package:movies_app/Screens/Movie Detials/Similar.dart';
import 'package:movies_app/Screens/Movie Detials/movies.dart';
import 'package:movies_app/Screens/Movie%20Detials/Genres.dart';
import 'package:movies_app/Screens/Movie%20Detials/cast.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/models/moviesDetials/Movie.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    String? movieId;

    if (args is String) {
      movieId = args;
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      body: FutureBuilder(
        future: ApiManager.getInstence().getDetials(movieId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading movie details"));
          }

          final movieRes = snapshot.data!;
          final movie = movieRes.data?.movie;

          if (movie == null) {
            return const Center(child: Text("Movie not found"));
          }

          return _buildContent(context, movie);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Movie movie) {
    return FutureBuilder(
      future: ApiManager.getInstence().getSuggestions(movie.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error loading similar movies"));
        }

        final suggestionsRes = snapshot.data!;
        final similarMovies = suggestionsRes.data?.movies ?? [];

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoviesHeader(movie: movie),
              Screenshots(movie: movie),
              Similar(movies: similarMovies),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Summary",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                      movie.descriptionIntro?.isNotEmpty == true
                          ? movie.descriptionIntro!
                          : (movie.descriptionFull ?? "No summary available"),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              CastSection(movie: movie),
              SizedBox(height: 10),
              Genres(movie: movie),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
