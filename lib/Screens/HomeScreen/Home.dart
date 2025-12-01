/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/language_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isEnglish;

    return Scaffold(
      backgroundColor: const Color(0xff121312),
      appBar: AppBar(
        backgroundColor: const Color(0xff121312),
        title: Text(
          isArabic ? 'الصفحة الرئيسية' : 'Home Screen',
          style: const TextStyle(color: Color(0xFFFFBB3B)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFFFFBB3B)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Color(0xFFFFBB3B),
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              isArabic ? 'مرحباً بك!' : 'Welcome!',
              style: const TextStyle(
                color: Color(0xFFFFBB3B),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isArabic ? 'تم تسجيل الدخول بنجاح' : 'Login Successful',
              style: const TextStyle(
                color: Color(0xFFFFBB3B),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
