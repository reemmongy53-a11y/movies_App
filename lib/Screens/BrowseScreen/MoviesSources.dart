import 'package:flutter/material.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/core/AppColor/color.dart';


import '../../models/listMovies/Movies.dart';

class MoviesSources extends StatelessWidget {
  final List<MoviesList> tabs;

  MoviesSources(this.tabs, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres =
        tabs.map((movie) => movie.genres![0]).toSet().toList();

    return DefaultTabController(
      length: genres.length,
      child: SafeArea(
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: genres.map((genre) {
                return Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.yellow),
                  ),
                  child: Text(
                    genre,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColor.yellow,
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: genres.map((genre) {
                  List<MoviesList> filteredMovies = tabs
                      .where((movie) => movie.genres!.contains(genre))
                      .toList();

                  return GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: filteredMovies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11,
                      mainAxisSpacing: 11,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.Details.name, arguments:  movie.id.toString(),);
                              },
                              child: Image.network(
                                movie.mediumCoverImage!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColor.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      movie.rating.toString(),
                                      style: TextStyle(
                                          color: AppColor.white, fontSize: 12),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.star,
                                        color: AppColor.yellow, size: 16),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
