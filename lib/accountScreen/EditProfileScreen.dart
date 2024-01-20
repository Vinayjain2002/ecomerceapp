import 'package:flutter/material.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:emart_app/widgetCommon/customTextFIeld.dart';
import 'package:emart_app/widgetCommon/submitButton.dart';
import 'package:flutter/material.dart';

import '../consts/images.dart';
import '../consts/styles.dart';

// class EditProfileScreen extends StatelessWidget {
//   EditProfileScreen({super.key});
//
//   TextEditingController firstnamecontroller = TextEditingController();
//   TextEditingController lastnamecontroller = TextEditingController();
//   TextEditingController mobilenocontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//           children:[
//             Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                   height: MediaQuery.of(context).size.height*0.4,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.cover),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       Text("Edit Profile", style: TextStyle(color: Colors.black54, fontFamily: semibold),),
//                       Align(
//                         alignment: Alignment.center,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: MediaQuery.of(context).size.width*0.14,
//                           child: CircleAvatar(
//                               radius: MediaQuery.of(context).size.width*0.13,
//                               backgroundImage: const AssetImage(imgB1)
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             SizedBox(height: MediaQuery.of(context).size.height*0.4,),
//             SingleChildScrollView(
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 40,),
//                     Container(
//                         margin: EdgeInsets.symmetric(horizontal: 15),
//                         height: MediaQuery.of(context).size.height*0.58,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             CustomTextField(context: context, title: "First Name", hintText: "vinay", controller: firstnamecontroller),
//                             CustomTextField(context: context, title: "Last Name", hintText: "jain", controller: lastnamecontroller),
//                             SizedBox(height: 10,),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width*0.4,
//                               child: SubmitButton(context: context, color: redColor, textcolor: whiteColor, title: "Submit", onPress: (){
//                                 //todo here we are going to define the logic to change the name of teh person
//                               }),
//                             ),
//                             SizedBox(height: 20,),
//                             CustomTextField(context: context, title: "Mobile Number", hintText: "9306...", controller: mobilenocontroller),
//                             CustomTextField(context: context, title: "Email ID", hintText: "jain..@gmail.com", controller: emailcontroller),
//                             SizedBox(height: 30,),
//
//                           ],
//                         )
//                     ),
//                     GestureDetector(
//                       onTap: (){
//
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.2),
//                         ),
//                         child: Text("Deactivate Account",textAlign: TextAlign.center,style: TextStyle(color: Colors.black54,fontFamily: semibold,fontSize: 19),),),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ]
//       ),
//     );
//   }
// }

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key});

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController mobilenocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                      SizedBox(width: 30,),
                      Text("Edit Profile", style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: semibold)),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.width * 0.13,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.12,
                        backgroundImage: const AssetImage(imgB1),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                            (Set<MaterialState> states) {
                          return BorderSide(
                            color: Colors.white, // Change this color to the desired border color
                            width: 1.0, // You can adjust the width of the border
                            style: BorderStyle.solid, // Change this to BorderStyle.solid, dashed, or dotted
                          );
                        },
                      ),
                    ),
                      onPressed: (){}, child: Text("Edit Picture",style: TextStyle(color: Colors.white),)),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.32),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    // Remove the height constraint or set it to null/double.infinity
                    // height: MediaQuery.of(context).size.height * 0.58,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(context: context, title: "First Name", hintText: "vinay", controller: firstnamecontroller),
                        SizedBox(height: 8),
                        CustomTextField(context: context, title: "Last Name", hintText: "jain", controller: lastnamecontroller),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: SubmitButton(
                            context: context,
                            color: redColor,
                            textcolor: whiteColor,
                            title: "Submit",
                            onPress: () {
                              // todo here we are going to define the logic to change the name of the person
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05),
                        CustomTextField(context: context, title: "Mobile Number", hintText: "9306...", controller: mobilenocontroller),
                        SizedBox(height: 5),
                        CustomTextField(context: context, title: "Email ID", hintText: "jain..@gmail.com", controller: emailcontroller),
                        SizedBox(height: 10,),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: SubmitButton(
                            context: context,
                            color: redColor,
                            textcolor: whiteColor,
                            title: "Submit",
                            onPress: () {
                              // todo here we are going to define the logic to change the name of the person
                            },
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.05),
                        CustomTextField(context: context, title: "Old Password", hintText: passwordHint, controller: mobilenocontroller),
                        SizedBox(height: 5),
                        CustomTextField(context: context, title: "New Password", hintText: passwordHint, controller: emailcontroller),
                        SizedBox(height: 10,),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: SubmitButton(
                            context: context,
                            color: redColor,
                            textcolor: whiteColor,
                            title: "Submit",
                            onPress: () {
                              // todo here we are going to define the logic to change the name of the person
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width*1,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Text(
                              "Deactivate Account",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black54, fontFamily: semibold, fontSize: 19),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

