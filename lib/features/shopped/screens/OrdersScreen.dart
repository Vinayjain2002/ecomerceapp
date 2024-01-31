
import 'package:emart_app/utils/constants/styles.dart';
import 'package:emart_app/widgetCommon/Rating.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/List.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              iconTheme: const IconThemeData(color: Colors.white,size: 28,weight: 600),
              title: const Text(orders,style: TextStyle(color: Colors.white,fontSize:23,fontFamily: semibold),),
              actions: [
                IconButton(onPressed: (){

                }, icon: const Icon(Icons.person)),
                const SizedBox(width: 10,),
              ],
              bottom: PreferredSize(

                preferredSize: const Size.fromHeight(60), // Adjust height as needed
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.88,
                  child: const TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                      prefixIcon: Icon(Icons.search,color: whiteColor,size: 25,weight: 300,),
                      hintText: "Search Items here..",
                      hintStyle: TextStyle(color:whiteColor)
                    )
                  ),
                ),
              ),
            ),
          body: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              width: MediaQuery.of(context).size.width*1,
            color: Colors.white,
            child: ListView.separated(itemBuilder: (context,index)=>SizedBox(
              child: GestureDetector(
                onTap: (){
                  // here we are defining the code to navigate to a particuar item page
                },
                child: ListTile(
                  leading: Image.asset(OrderHistoryImage[index],width: MediaQuery.of(context).size.width*0.2,),
                  title: Column(
                    children: <Widget>[
                      const SizedBox(height: 3,),
                      const Text("Deliver at Oct 26,2023", style: TextStyle(color: Colors.black87,fontSize: 16),textAlign: TextAlign.center,),
                      const Text("description",style: TextStyle(color: Colors.grey,fontSize: 15),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Rating(),
                      const SizedBox(height: 6,),
                      GestureDetector(
                        child: const Text("Write a Review", style: TextStyle(color: Colors.blue,fontSize: 14),textAlign: TextAlign.center,),
                      )
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward,color: Colors.grey,size: 25,),
                ),
              ),
            ), separatorBuilder: (context,index)=>const Divider(
              color: Colors.grey,
            ), itemCount:4),
          ),
        )
    );
  }
}
