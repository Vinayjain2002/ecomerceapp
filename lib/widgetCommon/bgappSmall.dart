import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

/// so this is the Widget to Show the small background that used to appear at the background of the Login Screens

Widget BgAppSmall({required BuildContext context, Widget? childWidget}){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill),
    ),

    // so here we had specified the childWidget that is used to be passed by the LoginScreen
    child: childWidget,
  );
}