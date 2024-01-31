import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/styles.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            iconTheme: const IconThemeData(color: Colors.white,weight: 800),
            title: const Text("24X7 Customer Support", style: const TextStyle(color: Colors.white, fontFamily: semibold, fontSize: 20),),
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width*1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                    const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 1,
                            color: Colors.grey.withOpacity(0.5)
                          )
                        ]
                      ),
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, top: 6, bottom: 6),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width*0.75,child: const Text("Get Quick customer support by selecting your item", style: TextStyle(fontSize: 17),softWrap: true,)),
                          Image.asset(imgB1,width: MediaQuery.of(context).size.width*0.2,)
                        ],
                      ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width*1,
                    height: MediaQuery.of(context).size.height*0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey.withOpacity(0.5)
                          )
                        ]
                    ),
                    padding: const EdgeInsets.symmetric( vertical: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width*0.05),
                            child: const Text("Select the order to track and manage it conveniently",softWrap: true, style: TextStyle(fontSize: 17),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Expanded(
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index)=>GestureDetector(
                                  onTap: (){
                                    //todo here we will define the code that we need help with this Item.
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1,spreadRadius: 1)
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: Image.asset(imgB1, height: MediaQuery.of(context).size.height*0.1,),
                                      title: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Apple Iphone 15 Pro Max with 256Gb", maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          Text("Delivered on Oct 26, 2023", style: TextStyle(fontSize: 14),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder:  (context,index)=> const Divider(),
                                itemCount: 3)
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: 10),
                            width: MediaQuery.of(context).size.width*1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1
                                )
                              ]
                            ),
                            child: const Text("View More.",
                              style: TextStyle(
                              fontSize:17,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                            child: const Text("What issue are you facing.",style: TextStyle(fontSize: 17),)),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index)=>const ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Text("I wan't to manage my order.",style: TextStyle(fontSize: 15),),
                                    Text("View Cancel or return of a order", style: TextStyle(fontSize: 13, color: Colors.grey),)
                                  ],
                                ),
                                trailing: Icon(Icons.forward,color: Colors.black,),
                              ), separatorBuilder: (context,index)=> const Divider(), itemCount: 5),
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
