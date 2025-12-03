import 'package:flutter/material.dart';
import 'package:movies_app/models/moviesDetials/Movie.dart';

class Screenshots extends StatelessWidget {
  final Movie? movie;

  const Screenshots({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return const Center(
        child: Text(
          "No screenshots available",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final List<String> screenshotUrls = [];

    if (movie!.mediumScreenshotImage1?.isNotEmpty == true) {
      screenshotUrls.add(movie!.mediumScreenshotImage1!);
    } else if (movie!.largeScreenshotImage1?.isNotEmpty == true) {
      screenshotUrls.add(movie!.largeScreenshotImage1!);
    }

    if (movie!.mediumScreenshotImage2?.isNotEmpty == true) {
      screenshotUrls.add(movie!.mediumScreenshotImage2!);
    } else if (movie!.largeScreenshotImage2?.isNotEmpty == true) {
      screenshotUrls.add(movie!.largeScreenshotImage2!);
    }

    if (movie!.mediumScreenshotImage3?.isNotEmpty == true) {
      screenshotUrls.add(movie!.mediumScreenshotImage3!);
    } else if (movie!.largeScreenshotImage3?.isNotEmpty == true) {
      screenshotUrls.add(movie!.largeScreenshotImage3!);
    }


    if (screenshotUrls.isEmpty) {
      return const Center(
        child: Text(
          "No screenshots available",
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
            "Screen Shots",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),


        ...screenshotUrls.map((url) => _buildShot(url)).toList(),
      ],
    );
  }


  Widget _buildShot(String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          url,
          width: double.infinity,
          height: 167,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              width: double.infinity,
              height: 167,
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            width: double.infinity,
            height: 167,
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image, size: 50),
          ),
        ),
      ),
    );
  }
}
