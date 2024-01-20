import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

/// so this is the Widget to Show the small background that used to appear at the background of the Login Screens

Widget BgAppSmall({required BuildContext context, required Widget? childWidget}){
  return Container(
    height: MediaQuery.of(context).size.height*1,
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.cover),
    ),

    // so here we had specified the childWidget that is used to be passed by the LoginScreen
    child: childWidget,
  );
}