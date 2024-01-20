import 'package:emart_app/CartScreen/cartWidget/cartItem.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            iconTheme: IconThemeData(color: Colors.white, weight: 800),
            title: Text("My Cart", style: TextStyle(fontSize: 20, fontFamily: semibold,color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1
                      )]
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text:TextSpan(text: "Deliver to: ",style: TextStyle(fontSize: 16, color: Colors.black),children: [
                              TextSpan(text: " Vin...,",style: TextStyle(fontFamily: semibold)),
                              TextSpan(text: "132103",style: TextStyle(fontFamily: semibold))
                              ]
                           ),
                          ),
                          Text("street no-3, House no-112, Des Raj..",style: TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                      trailing: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              return BorderSide(
                                color: Colors.red, // Change this color to the desired border color
                                width: 1.0, // You can adjust the width of the border
                                style: BorderStyle.solid, // Change this to BorderStyle.solid, dashed, or dotted
                              );
                            },
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Text("change", style: TextStyle(fontSize: 17,color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 10,),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1, spreadRadius: 1)
                          ],
                        ),
                        child: CartItem(context: context),),
                      itemCount: 3,),
                  )
                ],
              )
            ),
          ),
        )
    );
  }
}