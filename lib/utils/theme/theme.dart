import 'package:emart_app/utils/theme/appBar_theme.dart';
import 'package:emart_app/utils/theme/bottomSheet_theme.dart';
import 'package:emart_app/utils/theme/elevated_btn_theme.dart';
import 'package:emart_app/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

//here we are going to define the theme of the System ie for the light and the dark theme data
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme=ThemeData(
    //todo scaffold color is predefined as the Colors.transparent
    scaffoldBackgroundColor: redColor.withOpacity(0),
    useMaterial3: true,
    fontFamily: 'popins',
    brightness: Brightness.light,
    primaryColor: redColor,
    textTheme: TTextTheme.lightTheme,
    elevatedButtonTheme: TElevatedBtnTheme.lightELevatedBtnTheme,
    // appBarTheme: TAppBarTheme.LightAppBarTheme,
    tooltipTheme: const TooltipThemeData( textStyle: TextStyle(color: Colors.grey, fontSize: 16.0),),
    bottomSheetTheme: TBottomSheetTheme.LightBottomSheetData,

  );
  static ThemeData darkTheme= ThemeData(
    scaffoldBackgroundColor: redColor.withOpacity(0),
    useMaterial3: true,
    fontFamily: 'popins',
    brightness: Brightness.dark,
    primaryColor: redColor,
    textTheme: TTextTheme.darkTheme,
    elevatedButtonTheme: TElevatedBtnTheme.darkELevatedBtnTheme,
    appBarTheme: TAppBarTheme.DarkAppBarTheme,
    tooltipTheme: const TooltipThemeData( textStyle: TextStyle(color: Colors.grey, fontSize: 16.0),),
    bottomSheetTheme: TBottomSheetTheme.DarkBottomSheetData,

  );
}
