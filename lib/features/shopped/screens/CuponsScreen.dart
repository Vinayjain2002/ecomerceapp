
import 'package:emart_app/features/shopped/screens/cartScreen.dart';
import 'package:emart_app/widgetCommon/CuponCard.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/List.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/consts.dart';
import '../../../utils/constants/styles.dart';
import '../../authentication/screens/AccountScreen.dart';


class CuponsScreen extends StatelessWidget {
  const CuponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
         appBar: AppBar(
           toolbarHeight: MediaQuery.of(context).size.height*0.08,
           iconTheme: const IconThemeData(color: whiteColor,weight: 800),
           title: const Text("Cupons", style: TextStyle(color: whiteColor,fontSize: 23, fontFamily: semibold),),
           actions: [
             IconButton(
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=> const CartScreen()
                       )
                      );
                   },
                 icon: const Icon(Icons.shopping_cart,color: whiteColor,)
             ),
             IconButton(
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>  AccountScreen()
                      )
                    );
                   },
                 icon: const Icon(Icons.person,color: whiteColor,)
             ),
             const SizedBox(width: 5,)
           ],
         ),
         body: Container(
           width: MediaQuery.of(context).size.width*1,
           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
           decoration: const BoxDecoration(
             color: Colors.white,
           ),
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
           child: Column(
             children: <Widget>[
               SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("My Cupons", style:  TextStyle(fontFamily: semibold, fontSize: 18),),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Text("Add Cupons", style: TextStyle(fontSize: 18, color: Colors.blue),),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
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
               const SizedBox(height: 20,),
               // here we are going to define the Cupons Aviable
               Expanded(
                 child: ListView.separated(itemBuilder: (context,index)=>GestureDetector(
                   onTap: (){

                   },
                   child: CuponContainer(context: context),
                 ),
                     separatorBuilder: (context,index)=>const Divider()
                     , itemCount: 8),
               )
             ],
           ),
         ),
        )
    );
  }
}
