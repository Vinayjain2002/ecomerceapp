import 'dart:io';

import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profileController.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/customTextFIeld.dart';
import 'package:emart_app/widgetCommon/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/images.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});

  TextEditingController editname=TextEditingController();
  TextEditingController editpassword=TextEditingController();
  TextEditingController editcontact=TextEditingController();
  TextEditingController editemail=TextEditingController();

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
                  radius: MediaQuery.of(context).size.width * 0.1,
                  backgroundImage: profilecontroller.imageUrl.isEmpty
                      ? AssetImage(imgB1)
                      : Image.file(File(profilecontroller.imageUrl.value)).image,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                SubmitButton(context: context, color: redColor, textcolor: whiteColor,onPress: (){
                  profilecontroller.changeImage(context: context);
                }, title: "Change"),
                SizedBox(height: 20,),
                CustomTextField(context: context, title: name, hintText: namehint, controller: editname),
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
                    //todo we need to define the code to checkout the logic for the submit button
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
