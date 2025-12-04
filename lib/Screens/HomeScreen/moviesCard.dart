import 'package:flutter/material.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/models/listMovies/Movies.dart';
import 'package:movies_app/models/listMovies/SourcesResponses.dart';

class MoviesCard extends StatefulWidget {
  final Function(String image)? onMovieChanged;

  const MoviesCard({super.key, this.onMovieChanged});

  @override
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> {
  List<MoviesList> snapshotMovies = [];
  int snapshotMoviesLength = 0;

  late PageController _controller;
  late Future<SourcesResponses> moviesFuture;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.7);

    moviesFuture = ApiManager.getInstence().getMoviesSources();

    _controller.addListener(() {
      if (_controller.page != null && widget.onMovieChanged != null) {
        int index = _controller.page!.round();

        if (mounted && index < snapshotMoviesLength) {
          widget.onMovieChanged!(
            snapshotMovies[index].largeCoverImage ?? "",
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponses>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData ||
            snapshot.data!.data?.movies == null ||
            snapshot.data!.data!.movies!.isEmpty) {
          return const Center(child: Text("No movies found"));
        }

        List<MoviesList> movies = snapshot.data!.data!.movies!;
        snapshotMovies = movies;
        snapshotMoviesLength = movies.length;

        return SizedBox(
          height: 360,
          child: PageView.builder(
            controller: _controller,
            itemCount: movies.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.Details.name,
                            arguments: movies[index].id.toString(),
                          );
                        },
                        child: Image.network(
                          movies[index].largeCoverImage ?? "",
                          width: 234,
                          height: 351,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
