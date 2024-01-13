import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/authController.dart';
import 'package:emart_app/views/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../consts/colors.dart';
import '../consts/strings.dart';
import '../consts/styles.dart';
import '../firebaseConstants/firebaseConstants.dart';
import '../widgetCommon/appLogoWidget.dart';
import '../widgetCommon/bgappSmall.dart';
import '../widgetCommon/customTextFIeld.dart';
import '../widgetCommon/submitButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
///this scree is for the purpos eof the signing up to the page
//todo we could also add the founctionality of the Sending the email to the user to validate the user.

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override

  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
  }
  bool isChecked=false;
  String fieldcondmessage="";
  bool passMatch=false;
  bool strongpass=false;
  bool validemail=false;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController retypepasswordController= TextEditingController();

  // we are getting our controller
  var controller= Get.put(AuthController());

  bool emailcheck(){
    // here we are going to check that the email of the user is of the correct format
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(emailController.text)){
      fieldcondmessage="Invalid Email";
    }
    return true;
  }
  bool passwordMatching(){
    // here we are going to match the password entered are corrects
      if(passwordController.text!=retypepasswordController.text){
        // so our password matches correctly
        fieldcondmessage="Passwords does not match";
        return false;
      }
      return true;
  }

  bool strongPassword(){
    // here we are going to check weather the password entered by the user are  strong
    String pattern = r'^(?=.*[A-Z])(?=.*[@!#$%^&*(),.?":{}|<>])(?=.*\d).{8,}$';
    RegExp regExp = RegExp(pattern);

    // Use the regex to test the password
     if(!regExp.hasMatch(passwordController.text)){
       fieldcondmessage="Password is too wick";
       return false;
     }
    return true;
  }
  Widget build(BuildContext context) {
    return  BgAppSmall(
      context: context,
      //it is the widget that we are going to pass to the Screen.
      childWidget: Scaffold(
        body: SingleChildScrollView(
          child: Center(
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
                              value: isChecked,
                              onChanged: (newvalue){
                                setState(() {
                                  isChecked=newvalue ?? false;
                                });
                              },
                              checkColor: redColor,
                              activeColor: Colors.grey,
                            ) ,
          
                            const SizedBox(width: 5,),
                            Expanded(
                              child: RichText(text: const TextSpan(
                                  children: [
                                    TextSpan(text: "I agree to the ", style: TextStyle(
                                      fontFamily: regular,
                                      color: Colors.grey,
          
                                    )),
          
                                    TextSpan(text: terms, style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    )),
          
                                    TextSpan(text: " & ", style: TextStyle(
                                      fontFamily: regular,
                                      color: Colors.grey,
                                    )),
          
                                    TextSpan(text: privacypolicy, style: TextStyle(
                                      fontFamily: regular,
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
                            child: SubmitButton(context: context,color: isChecked==true? redColor : lightGrey,textcolor: Colors.white, title: signup,
                                // here we need to define the condition that 
                                onPress: () async{
                                  strongpass=await strongPassword();
                                  validemail=await emailcheck();
                                  passMatch=await passwordMatching();
                                  if(isChecked!=false && passMatch==true &&  strongpass==true && validemail){
                                    // ie the user had clicked on the essential permissions
                                    try{
                                      final signupresult=await controller.signUpMethod(context: context,emailAddress: emailController.text, password: passwordController.text);
          
                                      if(signupresult!=null){
                                        // user is not already present
                                        await controller.storeUserData(name: nameController.text, email: emailController.value, password: passwordController).then((value){
                                          // we are navigating it to the home Screen
                                          VxToast.show(context, msg: login);
                                            return Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                                        });
                                      }
          
                                    }
                                    catch(e){
                                      auth.signOut();
                                      VxToast.show(context, msg: e.toString());
                                      print("the error encountered is $e");
                                    }
                                  }
                                  else{
                                    // ie one or more fields are not correct
                                    VxToast.show(context, msg: fieldcondmessage);
                                  }
                            })
                        ),
          
                        // already a user/account
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(text: alreadyHaveAccount,style: TextStyle(fontFamily: bold, color:Colors.grey )),
                                TextSpan(text: login,style: TextStyle(fontFamily: bold, color: redColor, fontSize: 18)),
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
      ),
    );
  }
}
