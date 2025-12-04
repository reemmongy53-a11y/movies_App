import 'package:flutter/material.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/models/moviesDetials/Movie.dart';

class Genres extends StatelessWidget {
  final Movie movie;

  const Genres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Genres",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: (movie.genres ?? [])
                .map(
                  (g) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.darkGray,
                ),
                child: Text(
                  g,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
