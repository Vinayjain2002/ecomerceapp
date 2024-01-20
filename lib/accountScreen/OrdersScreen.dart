import 'package:emart_app/consts/LIst.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              iconTheme: IconThemeData(color: Colors.white,size: 28,weight: 600),
              title: Text("My Orders",style: TextStyle(color: Colors.white,fontSize:23,fontFamily: semibold),),
              actions: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.person)),
                SizedBox(width: 10,),
              ],
              bottom: PreferredSize(

                preferredSize: Size.fromHeight(60), // Adjust height as needed
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.88,
                  child: TextField(
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
            child: ListView.separated(itemBuilder: (context,index)=>Container(
              child: GestureDetector(
                onTap: (){
                  // here we are defining the code to navigate to a particuar item page
                },
                child: ListTile(
                  leading: Image.asset(OrderHistoryImage[index],width: MediaQuery.of(context).size.width*0.2,),
                  title: Column(
                    children: <Widget>[
                      SizedBox(height: 3,),
                      Text("Deliver at Oct 26,2023", style: TextStyle(color: Colors.black87,fontSize: 16),textAlign: TextAlign.center,),
                      Text("description",style: TextStyle(color: Colors.grey,fontSize: 15),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      VxRating(
                        onRatingUpdate: (value) {
                          // Handle rating update

                        },
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        maxRating: 2,
                        size: 20,
                        count: 5,
                        stepInt: true,
                      ),
                      SizedBox(height: 6,),
                      GestureDetector(
                        child: Text("Write a Review", style: TextStyle(color: Colors.blue,fontSize: 14),textAlign: TextAlign.center,),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward,color: Colors.grey,size: 25,),
                ),
              ),
            ), separatorBuilder: (context,index)=>Divider(
              color: Colors.grey,
            ), itemCount:4),
          ),
        )
    );
  }
}
