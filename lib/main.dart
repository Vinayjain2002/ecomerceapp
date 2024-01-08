import 'package:emart_app/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //todo we may need to use the routers for the navigation onto the Different Screen.

  Widget build(BuildContext context) {
    return MaterialApp(
      // going to remove the tag from the app
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: regular,
      ),

      // we are going to show the splash Screen ie when the app starts
      home: const SplashScreen(),
    );
  }
}
