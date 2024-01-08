import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

///this is going to be a button which will be used for the purpose of submission in the login page

Widget SubmitButton({required BuildContext context,color, textcolor,String? title,  onPress}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(12),

      ),
      onPressed: onPress,
      child: Text(title!, style: TextStyle(fontFamily: bold, color: textcolor),));
}
