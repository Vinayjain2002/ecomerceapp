
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
//todo we need to make the corner rounded of the icon ie it is causing error when the .rounded is used after the padding

Widget appLogoWidget(BuildContext context) {
  // Here we are going to create the widget that is used to represent the logo of the app, i.e., the shopping bag.

  // Here we will use the Velocity X
  return Image.asset(icAppLogo)
      .box
      .white
      .size(MediaQuery.of(context).size.width * 0.1, MediaQuery.of(context).size.height * 0.08)
      .padding(const EdgeInsets.all(8))
      .make();
}
