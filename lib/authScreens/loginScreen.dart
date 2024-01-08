import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/appLogoWidget.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/customTextFIeld.dart';
import 'package:flutter/material.dart';

/// this the login Screen from where the user will have the different options to login into the app

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController=  TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BgAppSmall(context: context,
    //it is the widget that we are going to pass to the Screen.

    childWidget: Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            appLogoWidget(context),

            const SizedBox(height: 10,),
            const Text("Login in to $appname", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 22, fontFamily: bold),)
            ,

            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    CustomTextField(context: context,title: "Email",hintText: emailHint, controller: emailController),
                    CustomTextField(context: context,title: "Password", hintText: passwordHint,controller: passwordController),

                    // now we are going to create a button for the forgetPasswords
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){

                        }, child:const Text(forgetpass,)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
