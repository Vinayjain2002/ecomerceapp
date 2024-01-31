import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/styles.dart';

Widget homeButtons({required icon,String? title,onPress,width,height}){
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // here we are going to place the image and the text
        Image.asset(icon,width: 26,),
        const SizedBox(height: 10,),
         Text(title!, style: TextStyle(fontFamily: semibold, color: darkFontGrey, ),textAlign:TextAlign.center,)
      ],
    ),
  );
}