import 'package:emart_app/utils/constants/consts.dart';
import 'package:emart_app/views/Screens/Home.dart';
import 'package:emart_app/widgetCommon/appLogoWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/authentication/controller/authController.dart';
import '../features/authentication/screens/loginScreen.dart';
import '../userData/userInfo.dart';
import '../utils/constants/strings.dart';

/// So here we use the VelocityX for the purpose of creating the layout and this page is the firstpage
/// that is used to show the details of the app ie the version, logo, name etc.

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller= Get.put(AuthController());
  // we are going to create a method to change the Screen ie navigation to the other Page
  changeScreen(){
    // so it will redirect to the LpginScreen after a delay of the 3 Seconds.
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }


  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => loginUser()
      // this code is for getting a callback after the screens is completed and we need to autologin the user
      );
  }

void loginUser() async {
  try{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    bool isLoggedIn=prefs.getBool("isLoggedIn")?? false;
    if(isLoggedIn){
      // we need to redirect the user directly to the homScreen without any wait
      String? email=prefs.getString("email");
      print(email);
      String? password=prefs.getString("password");
      print(password);
      String? username= prefs.getString("username");
      String? phoneno= prefs.getString("phoneno");
      //creating a instance to authenticate the user email and the password
      final trylogging= await controller.loginMethod(context: context, emailAddress: email, password: password);
      // storing the data of the user in a file named as the userinfo for the future use of the data.
      if(trylogging != null){
        // here we will fetch the data for the Uid from the firestone
        final userData=await controller.getUserData(context: context, uid: trylogging);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
      }
    }
    else{
      // we are waiting for 2 sec for the screen to be created
      changeScreen();
    }
  }
  catch (e) {
    debugPrint("Error during auto-login: $e");
    // Clear SharedPreferences if authentication fails
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.clear();
    changeScreen();
  }
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
             const SizedBox(height: 5,),
          ],
        ),
      )
    );
  }
}
