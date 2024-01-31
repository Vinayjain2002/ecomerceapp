import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class TElevatedBtnTheme{
  TElevatedBtnTheme._();

  static final lightELevatedBtnTheme= ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        foregroundColor: Colors.white,
        backgroundColor: redColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,

        side: const BorderSide(color: redColor),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      )
  );

  static final darkELevatedBtnTheme= ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        //todo we need t change the theme of the btn colors
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,

        side: const BorderSide(color: redColor),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      )
  );

}