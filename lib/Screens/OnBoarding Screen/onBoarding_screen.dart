import 'package:flutter/material.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/core/cach/shared_preferences.dart';
import 'package:movies_app/customWidget/linear_gradient.dart';

import '../../core/AppImage/image.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> image = [
    AppImage.onboarding1,
    AppImage.onboarding2,
    AppImage.onboarding3,
    AppImage.onboarding4,
    AppImage.onboarding5,
  ];
  List<String> titel = [
    "Discover Movies",
    "Explore All Genres",
    "Create Watchlists",
    "Rate, Review, and Learn",
    "Start Watching Now",
  ];
  List<String> text = [
    "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    "",
  ];
  List<linearGradient> Gradient = [
    linearGradient(
      startColor: AppColor.petrolBlue,
      endColor: AppColor.petrolBlue,
      startOpacity: 0.0,
      endOpacity: 1,
    ),
    linearGradient(
      startColor: AppColor.red,
      endColor: AppColor.red,
      startOpacity: 0.0,
      endOpacity: 1,
    ),
    linearGradient(
      startColor: AppColor.purple,
      endColor: AppColor.purple,
      startOpacity: 0.0,
      endOpacity: 1,
    ),
    linearGradient(
      startColor: AppColor.brownishRed,
      endColor: AppColor.brownishRed,
      startOpacity: 0.0,
      endOpacity: 1,
    ),
    linearGradient(
      startColor: AppColor.charcoalGray,
      endColor: AppColor.charcoalGray,
      startOpacity: 0.0,
      endOpacity: 1,
    ),
  ];
  int currentPage = 0;
  int index = 0;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: image.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(image[index], fit: BoxFit.cover),
                  Gradient[index],
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColor.black,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            titel[index],
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            text[index],
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppColor.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (currentPage < image.length - 1) {
                                SharedPref.saveBooleen(
                                  CachKeys.isFirstTime,
                                  false,
                                );
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Navigator.restorablePushNamed(
                                    context,
                                    AppRoute.LogIn.name,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              currentPage == image.length - 1
                                  ? "Finish"
                                  : "Next",
                            ),
                          ),
                          SizedBox(height: 10),
                          currentPage > 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    if (currentPage > 0) {
                                      controller.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text("Back"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.black,
                                    foregroundColor: AppColor.yellow,
                                  ),
                                )
                              : SizedBox(),
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
    );
  }
}
