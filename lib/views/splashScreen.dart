import 'package:emart_app/authScreens/loginScreen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/appLogoWidget.dart';
import 'package:flutter/material.dart';

/// So here we use the VelocityX for the purpose of creating the layout and this page is the firstpage
/// that is used to show the details of the app ie the version, logo, name etc.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // we are going to create a method to change the Screen ie navigation to the other Page
  changeScreen(){
    // so it will redirect to the LpginScreen after a delay of the 3 Seconds.
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }

  @override
  void initState() {
    // calling the change state for the navigation
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: <Widget>[
              // here we are going to use the background image of the red color and on that the icon is present
              Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg, width: MediaQuery.of(context).size.width*1,),),

            // it is the icon of the app
            appLogoWidget(context),
             SizedBox(height: MediaQuery.of(context).size.height*0.015,),
            // here the appname is the name of the app which is the ekart.
            appname.text.fontFamily(bold).size(22).white.make(),
            const SizedBox(height: 5,),
            appversion.text.white.size(18).make(),

            // here the Spacer of VelocityX is just like the Expanded Widget in teh normal
            const Spacer(),
            credits.text.white.fontFamily(semibold).minFontSize(17).make(),
            SizedBox(height: 5,),
          ],
        ),
      )
    );
  }
}
