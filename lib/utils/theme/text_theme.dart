import 'package:flutter/material.dart';

//here we are going to define the theme for the texts
class TTextTheme{
  //so the constructor is private and do not try to change it
  TTextTheme._();

  static TextTheme lightTheme= TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'sans_bold'),
    headlineMedium: const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600, color: Colors.black,fontFamily: 'sans_bold'),
    headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'sans_bold'),

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black, fontFamily: 'sans_semibold'),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'sans_semibold'),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black,fontFamily: 'sans_semibold'),

    bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,fontFamily: 'sans_semibold'),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black,fontFamily: 'sans_regular'),
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black,fontFamily: 'sans_regular'),

    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black, fontFamily: 'sans_regular'),
    labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5), fontFamily: 'sans_regular'),

  );
  static TextTheme darkTheme= TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'sans_bold'),
    headlineMedium: const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600, color: Colors.white,fontFamily: 'sans_bold'),
    headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'sans_bold'),

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white, fontFamily: 'sans_semibold'),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'sans_semibold'),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'sans_semibold'),

    bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,fontFamily: 'sans_semibold'),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white,fontFamily: 'sans_regular'),
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white,fontFamily: 'sans_regular'),

    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white, fontFamily: 'sans_regular'),
    labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5), fontFamily: 'sans_regular'),

  );
}