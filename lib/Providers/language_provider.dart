import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  String _currentLanguage = 'en'; // 'en' or 'ar'

  LanguageProvider(this.prefs) {
    _loadLanguage();
  }

  String get currentLanguage => _currentLanguage;
  bool get isEnglish => _currentLanguage == 'en';
  bool get isArabic => _currentLanguage == 'ar';

  void _loadLanguage() {
    _currentLanguage = prefs.getString('language') ?? 'en';
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _currentLanguage = language;
    await prefs.setString('language', language);
    notifyListeners();
  }

  void toggleLanguage() {
    _currentLanguage = _currentLanguage == 'en' ? 'ar' : 'en';
    prefs.setString('language', _currentLanguage);
    notifyListeners();
  }

  String translate(String key) {
    final Map<String, Map<String, String>> translations = {
      'email': {'en': 'Email', 'ar': 'البريد الإلكتروني'},
      'password': {'en': 'Password', 'ar': 'كلمة المرور'},
      'login': {'en': 'Login', 'ar': 'تسجيل الدخول'},
      'register': {'en': 'Register', 'ar': 'تسجيل'},
      'name': {'en': 'Name', 'ar': 'الاسم'},
      'phone': {'en': 'Phone Number', 'ar': 'رقم الهاتف'},
      'confirm_password': {'en': 'Confirm Password', 'ar': 'تأكيد كلمة المرور'},
      'create_account': {'en': 'Create Account', 'ar': 'إنشاء حساب'},
      'dont_have_account': {'en': "Don't Have Account ?", 'ar': 'ليس لديك حساب؟'},
      'already_have_account': {'en': 'Already Have Account ?', 'ar': 'لديك حساب بالفعل؟'},
      'forgot_password': {'en': 'Forget Password ?', 'ar': 'نسيت كلمة المرور؟'},
      'login_with_google': {'en': 'Login With Google', 'ar': 'تسجيل بواسطة جوجل'},
      'or': {'en': 'OR', 'ar': 'أو'},
    };

    return translations[key]?[_currentLanguage] ?? key;
  }
}