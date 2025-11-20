import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'Screens/Login_Screen/login.dart';
import 'services/app_service.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();

 runApp(
  EasyLocalization(
   supportedLocales: const [Locale('en'), Locale('ar')],
   path: 'assets/translations',
   fallbackLocale: const Locale('en'),
   child: ChangeNotifierProvider(
    create: (context) => AppService(),
    child: const MyApp(),
   ),
  ),
 );
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   title: 'Movies App',
   localizationsDelegates: context.localizationDelegates,
   supportedLocales: context.supportedLocales,
   locale: context.locale,
   theme: ThemeData(
    primaryColor: const Color(0xFFFFBB3B),
    fontFamily: 'Segoe UI',
   ),
   home: const LoginScreen(),
   debugShowCheckedModeBanner: false,
  );
 }
}