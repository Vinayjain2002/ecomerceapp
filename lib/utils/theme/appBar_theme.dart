import 'package:flutter/material.dart';

class TAppBarTheme{
  TAppBarTheme._();

  //here we are going to define the appBar Theme Color
  static const LightAppBarTheme= AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme:  IconThemeData(size: 24,color: Colors.white, weight: 800),
    titleTextStyle: TextStyle(fontSize: 20, fontFamily: 'sans_semibold',color: Colors.black,fontWeight: FontWeight.w600),
    actionsIconTheme:  IconThemeData(size: 24,color: Colors.black, weight: 800),
  );

  static const DarkAppBarTheme= AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(size: 24,color: Colors.white, weight: 800),
    titleTextStyle: TextStyle(fontSize: 20, fontFamily: 'sans_semibold',color: Colors.white,fontWeight: FontWeight.w600),
    actionsIconTheme:  IconThemeData(size: 24,color: Colors.white, weight: 800),
  );
}