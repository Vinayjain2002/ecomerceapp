import 'package:flutter/material.dart';
import '../consts/colors.dart';
import '../consts/strings.dart';
import '../consts/styles.dart';
import '../widgetCommon/appLogoWidget.dart';
import '../widgetCommon/bgappSmall.dart';
import '../widgetCommon/customTextFIeld.dart';
import '../widgetCommon/submitButton.dart';

///this scree is for the purpos eof the signing up to the page

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController retypepasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
      context: context,
      //it is the widget that we are going to pass to the Screen.
      childWidget: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              appLogoWidget(context),

              const SizedBox(height: 10,),
              const Text("Join the  $appname", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 22, fontFamily: bold),)
              ,

              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(spreadRadius: 1, color: Colors.grey,blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, vertical: MediaQuery.of(context).size.height*0.03),
                  child: Column(
                    children: <Widget>[
                      CustomTextField(context: context,title: "Name",hintText: namehint, controller: nameController),
                      CustomTextField(context: context,title: "Email", hintText: emailHint,controller: emailController),
                      CustomTextField(context: context,title: "Password", hintText: passwordHint,controller: passwordController),
                      CustomTextField(context: context,title: retypepassword, hintText: passwordHint,controller: retypepasswordController),

                      // this is the decleartion button
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: false,
                            onChanged: (newvalue){},
                            checkColor: redColor,
                          ) ,

                          const SizedBox(width: 5,),
                          Expanded(
                            child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(text: "I agree to the ", style: TextStyle(
                                  fontFamily: bold,
                                  color: Colors.grey,

                                )),

                                TextSpan(text: terms, style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                )),

                                TextSpan(text: " & ", style: TextStyle(
                                  fontFamily: bold,
                                  color: Colors.grey,
                                )),

                                TextSpan(text: privacypolicy, style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                ))

                              ]
                            ),),
                          )
                        ],
                      ),
                      // this is the final submit btn
                     const SizedBox(height: 10,),
                      SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          //todo we need to change the onpress value ie where to redirect the url
                          child: SubmitButton(context: context,color: redColor,textcolor: Colors.white, title: signup,onPress: (){
                          })
                      ),

                      // already a user/account
                     const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          // we need to navigate back to the login page
                          Navigator.pop(context);
                        },
                        child: RichText(text: const TextSpan(
                          children: [
                            TextSpan(text: alreadyHaveAccount,style: TextStyle(fontFamily: bold, color:Colors.grey )),
                            TextSpan(text: login,style: TextStyle(fontFamily: bold, color: redColor)),
                          ]
                        )),
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
