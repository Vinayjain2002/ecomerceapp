import 'package:emart_app/CartScreen/cartScreen.dart';
import 'package:emart_app/accountScreen/AccountScreen.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/CuponCard.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../consts/LIst.dart';

class CuponsScreen extends StatelessWidget {
  const CuponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
         appBar: AppBar(
           toolbarHeight: MediaQuery.of(context).size.height*0.08,
           iconTheme: IconThemeData(color: whiteColor),
           title: Text("Cupons", style: TextStyle(color: whiteColor,fontSize: 23, fontFamily: semibold),),
           actions: [
             IconButton(
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=> CartScreen()
                       )
                      );
                   },
                 icon: Icon(Icons.shopping_cart,color: whiteColor,)
             ),
             IconButton(
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=> AccountScreen()
                      )
                    );
                   },
                 icon: Icon(Icons.person,color: whiteColor,)
             ),
             SizedBox(width: 5,)
           ],
         ),
         body: Container(
           width: MediaQuery.of(context).size.width*1,
           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
           decoration: BoxDecoration(
             color: Colors.white,
           ),
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
           child: Column(
             children: <Widget>[
               SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("My Cupons", style: TextStyle(fontFamily: semibold, fontSize: 18),),
                    GestureDetector(
                      child: Text("Add Cupons", style: TextStyle(fontSize: 18, color: Colors.blue),),
                    )
                  ],
                ),
                SizedBox(height: 10,),
               //now here we are going to define a baner
               VxSwiper.builder(
                   aspectRatio: 16 / 9,
                   autoPlay: true,
                   height: MediaQuery.of(context).size.height * 0.1,
                   enlargeCenterPage: true,
                   itemCount: homeSwiperList.length,
                   itemBuilder: (context, index) {
                     return Card(
                       //todo we need to add the property to the card to make more attractive
                       elevation: 3,
                       margin:
                       const EdgeInsets.symmetric(horizontal: 15),
                       shadowColor: Colors.grey,
                       child: Image.asset(
                         homeSecondSwiperList[index],
                         fit: BoxFit.fill,
                       ),
                     );
                   }),
               SizedBox(height: 20,),
               // here we are going to define the Cupons Aviable
               Expanded(
                 child: ListView.separated(itemBuilder: (context,index)=>GestureDetector(
                   onTap: (){

                   },
                   child: CuponContainer(context: context),
                 ),
                     separatorBuilder: (context,index)=>Divider()
                     , itemCount: 8),
               )
             ],
           ),
         ),
        )
    );
  }
}
