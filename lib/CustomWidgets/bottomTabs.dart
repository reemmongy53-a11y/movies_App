import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Screens/HomeScreen/Home.dart';
import 'package:movies_app/Screens/SearchScreen/Search_cubit.dart';
import 'package:movies_app/core/AppColor/color.dart';
import 'package:movies_app/core/AppImage/image.dart';
import '../Screens/BrowseScreen/Browse.dart';
import '../Screens/ProfileScreen/Profile.dart';
import '../Screens/SearchScreen/Search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  String? _backgroundImage;

  final List<Widget> _pages = [
    Search(cubit: SearchCubit(ApiManager.getInstence())),
    Browse(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    if (_currentIndex == 0) {
      bodyContent = HomeBody(
        onMovieChanged: (image) {
          setState(() {
            _backgroundImage = image;
          });
        },
      );
    } else {
      bodyContent = _pages[_currentIndex - 1];
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          _backgroundImage == null
              ? Image.asset(
                  AppImage.onboarding5,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Image.network(
                  _backgroundImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),
          bodyContent,
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              _navItem(AppImage.icon1, 0),
              _navItem(AppImage.icon2, 1),
              _navItem(AppImage.icon3, 2),
              _navItem(AppImage.icon4, 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, int index) {
    return BottomNavigationBarItem(
      backgroundColor: AppColor.darkGray,
      icon: SizedBox(
        height: 23,
        width: 26,
        child: SvgPicture.asset(
          icon,
          color: _currentIndex == index ? AppColor.yellow : AppColor.white,
        ),
      ),
      label: "",
    );
  }
}
