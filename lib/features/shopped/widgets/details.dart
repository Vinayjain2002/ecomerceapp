import 'package:emart_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/styles.dart';


Widget accountDetails({required BuildContext context,width, String? count,String? title }){
  return  SizedBox(
    width: width,
    height: 65,
    child:  Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: lightGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(count!, style: const TextStyle(fontFamily: bold, color: darkFontGrey, ),),

          const SizedBox(height: 5,),
          Text(title!, style:const TextStyle(fontFamily: semibold, color: darkFontGrey),)
        ],
      ),
    ),
  );
}