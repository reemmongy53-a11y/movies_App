import 'package:flutter/material.dart';
import 'package:movies_app/models/moviesDetials/Movie.dart';
import 'package:movies_app/core/AppColor/color.dart';

class CastSection extends StatelessWidget {
  final Movie movie;

  const CastSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie.cast == null || movie.cast!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "No Cast Available",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            "Cast",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: movie.cast!.map((cast) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Container(
                height: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.darkGray,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: (cast.urlSmallImage != null && cast.urlSmallImage!.isNotEmpty)
                            ? Image.network(
                          cast.urlSmallImage!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 40),
                        )
                            : const Icon(Icons.person, size: 40),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${cast.name ?? 'Unknown'}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Character: ${cast.characterName ?? 'Unknown'}",
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
