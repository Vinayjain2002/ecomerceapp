//here we will create the controllers for the users to login into the account using the google, facebook and other options
import 'dart:io';
import 'package:emart_app/features/authentication/controller/authController.dart';
import 'package:emart_app/features/authentication/controller/profileController.dart';
import 'package:emart_app/features/authentication/controller/textFieldVerifier.dart';
import 'package:emart_app/userData/userInfo.dart';
import 'package:emart_app/utils/constants/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/customTextFIeld.dart';
import 'package:emart_app/widgetCommon/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';



class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  TextEditingController editname=TextEditingController();
  TextEditingController editpassword=TextEditingController();
  TextEditingController editretypepassword=TextEditingController();
  TextEditingController editcontact=TextEditingController();
  TextEditingController editemail=TextEditingController();

  bool strongpass=false;
  bool validphoneno=false;
  bool validemail=false;
  bool passMatch=false;
  String fieldcondmessage="";
  var controller= Get.put(AuthController());


  void textFieldsChecking(){
    strongpass= strongPassword(password: editpassword.text);
    validphoneno=validPhone(phoneno: editcontact.text);
    validemail= emailcheck(email: editemail.text);
    passMatch=passwordMatching(password: editpassword.text, retypepassword: editretypepassword.text);
    if(validemail==null){
      fieldcondmessage="Email is not valid";
    }else if(strongpass==null){
      fieldcondmessage="Password is not Strong";
    }else if(passMatch==null){
      fieldcondmessage="Passwords does not match";
    }else if(validphoneno==null){
      fieldcondmessage="Phone no is not valid.";
    }
  }
  // initializing the controller for the updataion of the image of the user
  var profilecontroller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return BgAppSmall(context: context,
        childWidget: Scaffold(
          appBar: AppBar(
            title: Text("Edit Profile", style: TextStyle(color: Colors.white, fontFamily: semibold),),
            iconTheme: IconThemeData(color: Colors.white, ),
          ),
          body: Obx(
                ()=> SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.height*0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white, // You can set the foreground color if needed
                      // Define border properties
                      radius: MediaQuery.of(context).size.width * 0.13,
                      backgroundImage: profilecontroller.imageUrl.isEmpty
                          ? AssetImage(imgB1)
                          : Image.file(File(profilecontroller.imageUrl.value)).image,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    SubmitButton(context: context, color: redColor, textcolor: whiteColor,onPress: (){
                      profilecontroller.changeImage(context: context);
                    }, title: "Change"),
                    SizedBox(height: 10,),
                    CustomTextField(context: context, title: name, hintText: namehint, controller: editname),
                    SizedBox(height: 10,),
                    CustomTextField(context: context, title: password, hintText: passwordHint,controller: editpassword),
                    SizedBox(height: 10,),
                    CustomTextField(context: context, title: password, hintText: passwordHint,controller: editpassword),
                    SizedBox(height: 10,),
                    CustomTextField(context: context,title: email,hintText: emailHint,controller: editemail),
                    SizedBox(height: 10,),
                    CustomTextField(context: context,title: mobilePhone,hintText: "9306...",controller: editcontact),
                    SizedBox(height: 20,),
                    // this button is for the purpose of the final submission of the data
                    SizedBox(
                      width: context.screenWidth*0.8,
                      child: SubmitButton(context: context, color: redColor, textcolor: whiteColor, title: submit,onPress: () async {
                        // //todo we need to define the code to checkout the logic for the submit button
                        // textFieldsChecking();
                        // if(strongpass && validphoneno && validemail&& passMatch){
                        // await profilecontroller.uploadProfileImage();
                        await controller.editUserData(context: context, uid: UserUid, name: editname.text, password: editpassword.text, email: editemail.text, phoneno: editcontact.text, cartCount: cart_count, whilistCount: whilist_count, orderCount: order_count);
                        VxToast.show(context, msg: 'profile Image Updated');
                        //todo await  controller.ChangeEmailPassword(email: editemail.text, password: editpassword.text);
                        // }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
