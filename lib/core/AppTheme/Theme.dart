import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/AppColor/color.dart';

class AppTheme{
  static var darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColor.grey,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: AppColor.yellow,
          foregroundColor: AppColor.black,
          textStyle: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColor.yellow),

          ),
        )
      )
  );
}