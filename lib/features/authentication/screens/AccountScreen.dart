
import 'package:emart_app/userData/userInfo.dart';
import 'package:emart_app/views/splashScreen.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/List.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';
import '../controller/autologin.dart';
import '../models/AccountsLIst.dart';


class AccountScreen extends StatelessWidget {
   AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        // here we are going to show the central part of the app
        childWidget: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
              weight: 800
            ),
            toolbarHeight: 50,
            titleSpacing: MediaQuery.of(context).size.width*0.06,
            title: Text("Profile", style: TextStyle(fontFamily: bold, fontSize: 23,color: Colors.white),),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top:5 ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // here we are going to give a option of the EditProfile to the user
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.width*0.14,
                      child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width*0.13,
                          backgroundImage: const AssetImage(imgB1)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.88,
                    height: MediaQuery.of(context).size.height*0.65,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.5)
                      )],
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Vinay jain", style: const TextStyle(fontFamily: bold, color: Colors.red,fontSize: 30),),
                        Text("jainv61787@gmail.com", style: const TextStyle(color: Colors.redAccent, fontSize: 16),),
                        SizedBox(height: 20,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context,index)=>GestureDetector(
                                onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> accountOptionsActions[index]));
                                },
                                child: ListTile(
                                  horizontalTitleGap: 25,
                                  leading: Icon(accountOptionsIcons[index],color: Colors.redAccent,size: 25,),
                                  title: Text(accountOptionsList[index], style: TextStyle(color: fontGrey,fontSize: 18,fontFamily: semibold),),
                                  trailing: Icon(Icons.arrow_forward,color: Colors.grey,),
                                ),
                              ),
                              separatorBuilder:(context,index)=> Divider(
                                color: Colors.grey,
                              ),
                              itemCount: accountOptionsList.length),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: SubmitButton(
                              context: context,
                              color: redColor,
                              textcolor: whiteColor,
                              title: logout,
                              onPress: () async {
                                UserEmail = "";
                                UserName = "";
                                UserMobileNo = "";
                                var autologin = Get.put(AutoLogin());
                                // CLearing the data stored inside the UserAutoLogin
                                await autologin.loggout();
                                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => const SplashScreen()), (Route<dynamic> route) => false, // Remove all previous routes);// Replaces all screens with HomeScreen
                                );
                              }
                              ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
