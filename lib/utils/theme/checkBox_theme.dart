import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TCheckBoxTheme{
  TCheckBoxTheme._();

  static CheckboxThemeData LightCheckBoxTheme= CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Colors.white;
      }
      else{
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return redColor;
      }
      else{
        return Colors.transparent;
      }
    }),


  );
  static CheckboxThemeData DarkCheckBoxTheme= CheckboxThemeData(

  );

}