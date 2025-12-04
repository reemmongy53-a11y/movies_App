import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/Screens/SearchScreen/Search_cubit.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/Routes/route.dart';
import 'package:movies_app/Screens/HomeScreen/Home.dart';
import 'package:movies_app/Screens/OnBoarding Screen/onBoarding_screen.dart';
import 'package:movies_app/Screens/OnBoarding Screen/onboardingPosters.dart';


import 'CustomWidgets/bottomTabs.dart';
import 'Screens/BrowseScreen/Browse.dart';
import 'Screens/LoginScreen/login.dart';
import 'Screens/Movie Detials/Movie_Detials.dart';
import 'Screens/ProfileScreen/Profile.dart';
import 'Screens/RegisterScreen/register.dart';
import 'Screens/SearchScreen/Search.dart';
import 'core/cach/shared_preferences.dart';
import 'core/AppTheme/Theme.dart' as AppTheme;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPref.init();

  bool isFirstTime = SharedPref.getBooleen(CachKeys.isFirstTime) ?? true;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ChangeNotifierProvider(
        create: (context) => AppService(),
        child: MyApp(isFirst: isFirstTime),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirst});
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      initialRoute:
      isFirst ? AppRoute.OnboardingPosters.name : AppRoute.Home.name,

      routes: {
        AppRoute.OnBoarding.name: (context) => OnBoarding(),
        AppRoute.OnboardingPosters.name: (context) => OnboardingPosters(),
        AppRoute.Home.name: (context) => Home(),
        AppRoute.LogIn.name: (context) => LoginScreen(),
        AppRoute.register.name: (context) => RegisterScreen(),
        AppRoute.Search.name: (context) => Search(cubit: SearchCubit(ApiManager.getInstence()),),
        AppRoute.Browse.name: (context) => Browse(),
        AppRoute.Profile.name: (context) => Profile(),
        AppRoute.Details.name: (context) => MovieDetailsPage(),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}
