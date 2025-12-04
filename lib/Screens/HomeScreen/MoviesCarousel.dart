import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/models/listMovies/SourcesResponses.dart';

import '../../core/AppColor/color.dart';
import '../../core/AppImage/image.dart';

class MoviesCarousel extends StatefulWidget {
  const MoviesCarousel({super.key});

  @override
  State<MoviesCarousel> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCarousel> {
  late PageController _controller;
  late Future<SourcesResponses> moviesFuture;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.5,
    );
    moviesFuture = ApiManager.getInstence().getMoviesSources();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponses>(
        future: moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (!snapshot.hasData ||
              snapshot.data!.data?.movies == null ||
              snapshot.data!.data!.movies!.isEmpty) {
            return const Center(child: Text("No movies found"));
          }

          var movies = snapshot.data!.data!.movies!;

          return Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Action",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoute.Browse.name);
                            },
                            child: Text("see More",
                                style: TextStyle(
                                    color: AppColor.yellow, fontSize: 16))),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.yellow,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _controller,
                        itemCount: movies.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoute.Details.name,
                                        arguments: movies[index].id.toString(),
                                      );
                                    },
                                    child: Image.network(
                                      movies[index].mediumCoverImage!,
                                      width: 146,
                                      height: 220,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 5,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColor.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        movies[index].rating.toString(),
                                        style: const TextStyle(
                                            color: AppColor.white,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(Icons.star,
                                          color: AppColor.yellow, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
