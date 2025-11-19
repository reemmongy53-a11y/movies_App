import 'package:flutter/material.dart';
import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/Screens/HomeScreen/Home.dart';
import 'package:movies_app/Screens/LogIn_Screen/logIn.dart';
import 'package:movies_app/Screens/OnBoarding%20Screen/onBoarding_screen.dart';
import 'package:movies_app/Screens/OnBoarding%20Screen/onboardingPosters.dart';
import 'package:movies_app/core/AppTheme/Theme.dart';

import 'core/cach/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  bool isFirstTime = SharedPref.getBooleen(CachKeys.isFirstTime) ?? true;

  runApp( MyApp( isFirst: isFirstTime,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirst});
  final bool isFirst ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,

      initialRoute: isFirst? AppRoute.OnboardingPosters.name: AppRoute.Home.name,
      routes: {
        AppRoute.OnBoarding.name: (context) => OnBoarding(),
        AppRoute.OnboardingPosters.name: (context) => OnboardingPosters(),
        AppRoute.Home.name: (context) => Home(),
        AppRoute.LogIn.name: (context) => LogIn(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
