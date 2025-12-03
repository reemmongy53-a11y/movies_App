import 'package:flutter/material.dart';
import 'Screens/EditProfileScreen/edit_profile.dart';
import 'Screens/HistoryScreen/history.dart';
import 'Screens/HomeScreen/home.dart';
import 'Screens/LoginScreen/login.dart';
import 'Screens/ProfileScreen/profile.dart';
import 'Screens/RegisterScreen/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFFFB800),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/history': (context) => HistoryScreen(),
        '/editProfile': (context) => EditProfileScreen(),
      },
    );
  }
}
