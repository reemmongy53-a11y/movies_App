import 'package:flutter/material.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/core/AppImage/image.dart';
import 'package:movies_app/models/moviesDetials/Movie.dart';
import 'package:url_launcher/url_launcher.dart';
class MoviesHeader extends StatelessWidget {
  final Movie movie;

  const MoviesHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              movie.largeCoverImage ?? movie.mediumCoverImage ?? "",
              width: double.infinity,
              height: 645,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.black.withOpacity(0.5),
                      AppColor.black.withOpacity(1),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, color: AppColor.white),
                  ),
                  Icon(Icons.bookmark, color: AppColor.white),
                ],
              ),
            ),
            Positioned(
              top: 248,
              left: 166,
              child: Image.asset(
                AppImage.Details,
                width: 79,
                height: 79,
              ),
            ),
            Positioned(
              top: 460,
              left: 29,
              right: 20,
              child: Text(
                movie.title ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Positioned(
              top: 520,
              left: 0,
              right: 0,
              child: Text(
                "${movie.year ?? 'No Year'}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.grey),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () async {
                  String url = "";


                  if (movie.slug != null && movie.slug!.isNotEmpty) {
                    url = "https://yts.lt/movies/${movie.slug}";
                  }


                  else if (movie.url != null && movie.url!.isNotEmpty) {
                    url = movie.url!;
                  }


                  if (url.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No valid link available")),
                    );
                    return;
                  }

                  final uri = Uri.tryParse(url);

                  if (uri == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid URL format")),
                    );
                    return;
                  }

                  try {

                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cannot open link")),
                    );
                  }
                },
                child: const Text("Watch"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.red,
                  foregroundColor: AppColor.white,
                  minimumSize: const Size(double.infinity, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            )

          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoBox(Icons.favorite, movie.likeCount?.toString() ?? "0"),
              infoBox(Icons.access_time_filled_outlined,
                  movie.runtime?.toString() ?? "0"),
              infoBox(Icons.star, movie.rating?.toString() ?? "0"),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.darkGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.yellow, size: 25),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: AppColor.white, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
