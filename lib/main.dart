import 'package:emart_app/utils/theme/theme.dart';
import 'package:emart_app/views/splashScreen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
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
      //this is going to be select the theme mode of the system

      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      // we are going to show the splash Screen ie when the app starts
      home: SplashScreen(),
    );
  }
}
