import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppService with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;
  bool get isArabic => _locale.languageCode == 'ar';

  void toggleLanguage(BuildContext context) {
    _locale = isArabic ? const Locale('en') : const Locale('ar');
    EasyLocalization.of(context)?.setLocale(_locale);
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}