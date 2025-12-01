import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isAr = context.locale.languageCode == 'ar';

    Widget flag(String asset, bool active, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: active ? Border.all(color: Colors.yellow, width: 2) : null,
          ),
          child: Image.asset(asset, width: 36, height: 24, fit: BoxFit.cover),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        flag('assets/images/egypt.png', isAr, () => context.setLocale(const Locale('ar'))),
        const SizedBox(width: 10),
        flag('assets/images/usa.png', !isAr, () => context.setLocale(const Locale('en'))),
      ],
    );
  }
}