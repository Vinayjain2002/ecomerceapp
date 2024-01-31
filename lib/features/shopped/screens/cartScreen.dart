import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../../../userData/userInfo.dart';
import '../../../utils/constants/List.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';
import '../widgets/cartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            title: const Text("My Cart"),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
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
                            text: TextSpan(text: deliverto,style: const TextStyle(fontSize: 16, color: Colors.black),children: [
                              TextSpan(text: " $UserName ",style: const TextStyle(fontFamily: semibold)),
                              TextSpan(text: " $UserPincode ",style:  const TextStyle(fontFamily: semibold))
                              ]
                           ),
                          ),
                          Text(userAddress,style: const TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                      trailing: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              return const BorderSide(
                                color: Colors.red, // Change this color to the desired border color
                                width: 1.0, // You can adjust the width of the border
                                style: BorderStyle.solid, // Change this to BorderStyle.solid, dashed, or dotted
                              );
                            },
                          ),
                        ),
                        onPressed: (){

                        },
                        child: const Text("change", style: TextStyle(fontSize: 17,color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                    const SizedBox(height: 10,),
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1, spreadRadius: 1)
                          ],
                        ),
                        child: CartItem(context: context, productName: IteminCart[index], productDetail: IteminCartDescription[index], offerPrice: "41%", oldPrice: 8000, newPrice: 4800,itemImage: cartItemImage[index])
                      ),
                      itemCount: IteminCart.length,),
                  )
                ],
              )
            ),
          ),
        )
    );
  }
}