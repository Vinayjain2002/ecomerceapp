import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
        context: context,
        childWidget: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            iconTheme: IconThemeData(color: Colors.white,size: 28,weight: 600),
            title: Text("24X7 Customer Support", style: TextStyle(color: Colors.white, fontFamily: semibold, fontSize: 20),),
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.person)),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                    SizedBox(height: 5,),
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
                          SizedBox(width: MediaQuery.of(context).size.width*0.75,child: Text("Get Quick customer support by selecting your item", style: TextStyle(fontSize: 17),softWrap: true,)),
                          Image.asset(imgB1,width: MediaQuery.of(context).size.width*0.2,)
                        ],
                      ),
                  ),
                  SizedBox(height: 15,),
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
                    padding: EdgeInsets.symmetric( vertical: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width*0.05),
                            child: Text("Select the order to track and manage it conveniently",softWrap: true, style: TextStyle(fontSize: 17),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Expanded(
                            child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index)=>GestureDetector(
                                  onTap: (){
                                    //todo here we will define the code that we need help with this Item.
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1,spreadRadius: 1)
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: Image.asset(imgB1, height: MediaQuery.of(context).size.height*0.1,),
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Apple Iphone 15 Pro Max with 256Gb", maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          Text("Delivered on Oct 26, 2023", style: TextStyle(fontSize: 14),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder:  (context,index)=> Divider(),
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
                            child: Text("View More.",
                              style: TextStyle(
                              fontSize:17,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                            child: Text("What issue are you facing.",style: TextStyle(fontSize: 17),)),
                        SizedBox(height: 10,),
                        Expanded(
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index)=>Container(
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Text("I wan't to manage my order.",style: TextStyle(fontSize: 15),),
                                  Text("View Cancel or return of a order", style: TextStyle(fontSize: 13, color: Colors.grey),)
                                ],
                              ),
                              trailing: Icon(Icons.forward,color: Colors.black,),
                            ),
                          ), separatorBuilder: (context,index)=> Divider(), itemCount: 5),
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
