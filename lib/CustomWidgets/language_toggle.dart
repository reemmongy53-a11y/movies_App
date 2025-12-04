import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  languageProvider.setLanguage('en');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: languageProvider.isEnglish
                        ? const Color(0xFFFFC107)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/usa_flag.png',
                        width: 24,
                        height: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                '🇺🇸',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  languageProvider.setLanguage('ar');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: languageProvider.isArabic
                        ? const Color(0xFFFFC107)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/egypt_flag.png',
                        width: 24,
                        height: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                '🇪🇬',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}