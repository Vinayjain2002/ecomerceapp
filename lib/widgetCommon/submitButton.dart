import 'package:flutter/material.dart';

import '../utils/constants/styles.dart';

///this is going to be a button which will be used for the purpose of submission in the login page

Widget SubmitButton({required BuildContext context,required color,required textcolor,required String? title, required onPress}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: Text(title!, style: TextStyle(fontFamily: bold, color: textcolor),));
}
