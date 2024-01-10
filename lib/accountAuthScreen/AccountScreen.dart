
import 'package:emart_app/accountAuthScreen/components/details.dart';
import 'package:emart_app/consts/LIst.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        // here we aere going to show the central part of the app
        childWidget: Scaffold(
          body: SafeArea(
            child: Container(
              padding:   EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02,left: 10,right: 10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // here we are going to give a option of the EditProfile to the user
                  GestureDetector(
                    onTap: (){
                      // here we need to define the function to edit the profiles.
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                        child: Icon(Icons.edit,color: Colors.white,)
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // here we are going to display the details of the User
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width*0.075,
                          backgroundImage: const AssetImage(imgB1)
                      ),
                      const SizedBox(width: 5,),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text("Vinay Jain", style: TextStyle(fontFamily: bold, color: Colors.white,fontSize: 17),),

                             Text("jainv61787@gmail.com", style: TextStyle(color: Colors.white, fontSize: 14),)
                                              ],
                                            ),

                      //Wea re going to define a logout Button
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          logout,
                          style: TextStyle(color: fontGrey, fontFamily: 'bold'),
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  // now we are going to create a section that display the detials related to the orderHistory Etc

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      accountDetails(context: context,width: MediaQuery.of(context).size.width/3.25, count: "00", title: "In your cart"),
                      accountDetails(context: context,width: MediaQuery.of(context).size.width/3.25, count: "32", title: "In your whilist"),
                      accountDetails(context: context,width: MediaQuery.of(context).size.width/3.25, count: "65", title: "In your Orders")
                    ],
                  ),
                  SizedBox(height: 40,),
                  // we are going to build the button Sections also
                  Container(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context,index){
                          // this is the seperator that is used to seperate teh items
                          return Divider(
                             color: textfieldGrey,
                          );
                        },
                        itemCount: profileButtonList.length,
                          itemBuilder: (BuildContext constext,int index){
                          return GestureDetector(
                            onTap: (){
                              // we nee dto redirect to the My Orders Page which contains the info of the Previous orders

                            },
                            child: ListTile(
                              leading: Image.asset(profileButtonIcon[index], width: 25,),
                              title: Text(profileButtonList[index],style: TextStyle(fontFamily: semibold, color: darkFontGrey,fontSize: 16),),

                            ),
                          );
                      }),
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
