import 'package:emart_app/utils/constants/List.dart';
import 'package:emart_app/widgetCommon/FilledButton.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/consts.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  const ItemDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // in this we are going to bring the two icons back
      appBar: AppBar(
        title: Text(title,style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: bold),),
        iconTheme: const IconThemeData(color: Colors.black87,size: 28),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){

          },icon: const Icon(Icons.favorite_border_outlined),)
        ],
      ),

      body: SizedBox(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(
              child: Padding(
              padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      VxSwiper.builder(
                        aspectRatio: 16/9,
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height * 0.18,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Image.asset(imgFc5,width: double.infinity, fit: BoxFit.cover,);
                          }),

                      const SizedBox(height: 10,),
                      Text(title, style: const TextStyle(fontSize: 23,fontFamily: semibold, color: darkFontGrey),),

                      const SizedBox(height: 10,),
                      // this section is used for the purpose of the ratings
                      VxRating(
                        onRatingUpdate: (value){

                      }, normalColor: textfieldGrey
                        ,selectionColor: golden
                        ,maxRating: 5,
                        size: 25
                        ,stepInt: true,),

                      const SizedBox(height: 10,),
                      const Text("\$30,000",style: TextStyle(fontFamily: bold, fontSize: 18, color: redColor),),

                      const SizedBox(height: 15,),
                      Container(
                        height: 70,
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: textfieldGrey,

                        ),
                        child: const Row(children: <Widget>[
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Seller",style: TextStyle(color: Colors.white,fontFamily: semibold ),),
                              SizedBox(height: 5,),
                              Text("In House Brand", style: TextStyle(color: darkFontGrey,fontFamily: semibold,),)
                            ],
                          )),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded, color: darkFontGrey,),
                          ),

                        ],),
                      ),

                      // now we are going to define the section
                      const SizedBox(height: 15,),
                      Container(
                        decoration: const BoxDecoration(color: Colors.white,),
                        child:  Column(
                          children: <Widget>[
                             Row(
                              // here we are going to define the colors options
                              children: <Widget>[
                                 SizedBox(width: MediaQuery.of(context).size.width*0.2,
                                child: const Text("Color", style:  TextStyle(fontSize: 16, color:  Colors.grey),),),

                                // we are going to define a list that will represent the Colors Boxes
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      child: Row(
                                        children: List.generate(
                                          3,
                                              (index) => VxBox().size(40, 40).color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 5)).roundedFull.make(),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                // now we are going to defie the quantity row

                              ],
                            ),

                            SizedBox(

                              child: Row(
                                children: [
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width*0.2,
                                    child: const Text("Quantity",style:  TextStyle(fontSize: 16, color: Colors.grey),),
                                  ),
                                  // so this is the Quantity Buttons
                                  Row(
                                  children: <Widget>[
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                                    const Text("0", style: TextStyle(fontSize: 15, color: darkFontGrey,fontFamily: bold),),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.add)),

                                    //  now we are going to show the no of the products Aviable
                                    const SizedBox(width: 10,),
                                    const Text("0 Aviable", style: TextStyle( color: Colors.grey),)
                                  ],
                                ),
                              ]),
                            ),

                             SizedBox(

                              child:  Row(
                                children: [
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width*0.2,
                                    child: const Text("Total: ",style:  TextStyle(fontSize: 16, color: Colors.grey),),
                                  ),
                                  // here we are going to represent the total Amounts
                                  const SizedBox(width: 10,),
                                  const Row(
                                  children:  <Widget>[
                                    Text("\$0.00", style: TextStyle(color: redColor, fontSize: 16, fontFamily: bold),
                                    )
                                  ],
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),

                      // we are going to define the description of the products.
                      const SizedBox(height: 15,),
                      //todo we need to add the functionality of the increasing the Size of the Description when the user clicks on load More
                      Card(
                        elevation: 3,
                        shadowColor: fontGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           const  SizedBox(height: 10,),
                           const  Text("Description", style: TextStyle(color: darkFontGrey, fontFamily: semibold, fontSize: 17),textAlign: TextAlign.start,),
                           const  SizedBox(height: 10,),
                           const  Text("This is a dummy item and dummy Description Here..",style: TextStyle(color: darkFontGrey),),
                            GestureDetector(
                              onTap: (){

                              },
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                    child: Text("Load more.",
                                      style: TextStyle(color: fontGrey),
                                      textAlign: TextAlign.right,
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: List.generate(
                              itemDetailedButtonList.length,
                              (index) =>  Card(
                                elevation: 3,
                                color: Colors.white,
                                shadowColor: textfieldGrey,
                                child: ListTile(title: Text(
                                    itemDetailedButtonList[index], style: const TextStyle(fontFamily: semibold,color: darkFontGrey),
                                      ),
                                    trailing: const Icon(Icons.arrow_forward),
                                ),
                              ),

                        ),
                      ),

                      // products you may also like
                      const SizedBox(height: 15,),
                      const Text(similarProduct, style: TextStyle(fontFamily: bold, fontSize: 16, color: darkFontGrey),)
                    ],
                  ),
                ),
          ),
          ),),
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                child: BookItemButton(context: context, title: "Add to Cart", onPress: (){
                }),
              )
            ],
          ),
      ),
    );
  }
}
