
import 'package:emart_app/features/authentication/controller/authController.dart';
import 'package:emart_app/views/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../firebaseConstants/firebaseConstants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/consts.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';
import '../../../widgetCommon/appLogoWidget.dart';
import '../../../widgetCommon/bgappSmall.dart';
import '../../../widgetCommon/customTextFIeld.dart';
import '../../../widgetCommon/submitButton.dart';
import '../controller/autologin.dart';
import '../controller/textFieldVerifier.dart';
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
  bool validphoneno=false;

  TextEditingController phonenoController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController retypepasswordController= TextEditingController();

  // we are getting our controller
  var controller= Get.put(AuthController());
  // we are importing the controller for the purpose of the autologin of the user
  var autologin= Get.put(AutoLogin());

  void textFieldsChecking(){
    strongpass= strongPassword(password: passwordController.text);
    validphoneno=validPhone(phoneno: phonenoController.text);
    validemail= emailcheck(email: emailController.text);
    passMatch=passwordMatching(password: passwordController.text, retypepassword: retypepasswordController.text);

    if(validemail==false){
      fieldcondmessage="Email is not valid";
    }else if(strongpass==false){
      fieldcondmessage="Password is not Strong";
    }else if(passMatch==false){
      fieldcondmessage="Passwords does not match";
    }else if(validphoneno==false){
      fieldcondmessage="Phone no is not valid.";
    }
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
                Obx(
                      ()=> Container(
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
                          CustomTextField(context: context,title: "Phone No", hintText: phoneHint,controller: phonenoController),

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
                          controller.isLoading.value ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ): SizedBox(
                              width: MediaQuery.of(context).size.width*0.8,
                              //todo we need to change the onpress value ie where to redirect the url
                              child: SubmitButton(context: context,color: isChecked==true? redColor : lightGrey,textcolor: Colors.white, title: signup,
                                  // here we need to define the condition that
                                  onPress: () async{
                                    // for cheking the correctness of the textFields.
                                    textFieldsChecking();
                                    if(isChecked!=false && passMatch==true &&  strongpass==true && validemail&& validphoneno){
                                      // ie the user had clicked on the essential permissions
                                      controller.isLoading(true);
                                      try{
                                        final signupresult=await controller.signUpMethod(context: context,emailAddress: emailController.text, password: passwordController.text);
                                        //todo we also need to add the functionality to display the message in case if any error is occuring.

                                        if(signupresult!=null){
                                          // user is not already present
                                          await controller.storeUserData(context: context,name: nameController.text, email: emailController.text, password: passwordController.text, phoneno: phonenoController.text);
                                          // adding the functionality to store the all the credentials of the user for future autologin
                                          await autologin.storedata(email: emailController.text, password: passwordController.text, phoneno: phonenoController.text, username: nameController.text);
                                            // we are navigating it to the home Screen
                                            VxToast.show(context, msg: login);
                                            nameController.text="";
                                            emailController.text="";
                                            passwordController.text="";
                                            retypepasswordController.text="";
                                            phonenoController.text="";
                                            isChecked=false;
                                            return Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                                        }
                                          else{
                                            controller.isLoading(false);
                                        }
                                      }
                                      catch(e){
                                        auth.signOut();
                                        controller.isLoading(false);
                                        VxToast.show(context, msg: e.toString());
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
