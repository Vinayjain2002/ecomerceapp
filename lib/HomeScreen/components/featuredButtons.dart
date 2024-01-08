import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

/// Here we are going to create the featursd Buutons that used to be displayed after the feature
Widget featuredButton({required BuildContext context, image,String? title}){
  return Container(
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(4),
    width: MediaQuery.of(context).size.width*0.2,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),

    ),
    child: Row(
      children: <Widget>[
        Image.asset(image, width: 60, fit: BoxFit.fill,),

        SizedBox(height: 10,),
        Text(title!,style: TextStyle(fontFamily: semibold, color: darkFontGrey),)
      ],
    ),
  );
}