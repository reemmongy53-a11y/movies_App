import 'package:flutter/material.dart';
import 'package:movies_app/Screens/HomeScreen/MoviesCarousel.dart';
import 'package:movies_app/Screens/HomeScreen/moviesCard.dart';
import 'package:movies_app/core/AppImage/image.dart';

class HomeBody extends StatelessWidget {
  final Function(String image)? onMovieChanged;
  const HomeBody({super.key, this.onMovieChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset(AppImage.Available)),
        MoviesCard(onMovieChanged: onMovieChanged),
        Center(child: Image.asset(AppImage.Watch)),
        MoviesCarousel(),
      ],
    );
  }
}
