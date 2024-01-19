import 'package:emart_app/authScreens/SignUp.dart';
import 'package:emart_app/consts/LIst.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/appLogoWidget.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/customTextFIeld.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../views/Screens/Home.dart';
import '../widgetCommon/submitButton.dart';
import 'package:emart_app/controllers/authController.dart';
/// this the login Screen from where the user will have the different options to login into the app

//todo we need to make it responsive and edit the code as well as make it scrollable ie Single Child ScrollVIew

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController=  TextEditingController();
  TextEditingController passwordController= TextEditingController();

  // definning the controller for the purpose of the authenticating the user
  var controller= Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
      context: context,
    //it is the widget that we are going to pass to the Screen.
    childWidget: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.08,),
              appLogoWidget(context),

              const SizedBox(height: 10,),
              const Text("Login in to $appname", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 22, fontFamily: bold),)
              ,

              SizedBox(height: MediaQuery.of(context).size.height*0.025),
              // it will be used for the purpose of showing a icon while the user is getting loginned

              Obx(
                    ()=>Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(spreadRadius: 1, color: Colors.grey,blurRadius: 5,)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, vertical: MediaQuery.of(context).size.height*0.03),
                    child: Column(
                      children: <Widget>[
                        CustomTextField(context: context,title: "Email",hintText: emailHint, controller: emailController),
                        CustomTextField(context: context,title: "Password", hintText: passwordHint,controller: passwordController),

                        // now we are going to create a button for the forgetPasswords
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              //todo we need to define the navigator to be push when the user click on the forget password
                            },
                            child: Text(forgetpass,style: TextStyle(color: Vx.gray500),),
                          )
                        ),
                        SizedBox(height: 8,),
                        // submit btn is going to be created
                        controller.isLoading.value ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        ):
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                            //todo we need to change the onpress value ie where to redirect the url

                            child: SubmitButton(context: context,color: redColor,textcolor: Colors.white, title: login,onPress: () async {
                              controller.isLoading(true);
                              // so here we need to match the user credentials with the already present data in the firestone.
                              try{
                                final tryLogging = await controller.loginMethod(context: context,emailAddress: emailController.text, password: passwordController.text);

                                if(tryLogging!=null){
                                  // means no error while logging
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                }
                                else{
                                  controller.isLoading(false);
                                  print("Some error encountered while Logging");
                                }
                              }
                              catch(e){
                                controller.isLoading(false);
                                print("eror while logining the user is");
                              }
                            })
                        ),

                        const SizedBox(height: 3,),
                        // now we need to define the create new account
                        const Text(createnewaccount, style: TextStyle(color: fontGrey),),

                        // sign up options
                        const SizedBox(height: 5,),
                        SizedBox(
                            width: MediaQuery.of(context).size.width*0.8,
                            //todo we need to change the onpress value ie where to redirect the url

                            child: SubmitButton(context: context,color: lightgolden,textcolor: redColor, title: signup,onPress: (){
                              // we need to navigate to the signuppage
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                            })
                        ),

                        // now we are going to give the user different options to login with ie with teh help of the google and the other things
                        const SizedBox(height: 10,),
                       const Text(loginwith, style: TextStyle(color: fontGrey),),
                        const SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(socialIconList.length, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: lightGrey,
                              // here we will place our icons
                              child: Image.asset(socialIconList[index],width: 45,),
                            ),
                          ))
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
