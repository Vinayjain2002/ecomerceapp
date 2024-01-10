import 'package:emart_app/categoryScreen/ItemDetails.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../consts/images.dart';
import '../consts/styles.dart';

class DetailedCategory extends StatefulWidget {
  final String title;

  const DetailedCategory({Key? key, required this.title}) : super(key: key);

  @override
  State<DetailedCategory> createState() => _DetailedCategoryState();
}

class _DetailedCategoryState extends State<DetailedCategory> {
  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
      context: context,
      childWidget: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(fontFamily: bold, color: Colors.white,),),
          // we are going to change the Style of the NavBar also
          iconTheme: const IconThemeData(color: Colors.white,size: 29),
          leadingWidth: MediaQuery.of(context).size.width*0.1,
        ),

        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            // in this we are going to generate the three different categories in the horizontla line
            children:[
              SingleChildScrollView(
                // it is used to apply the special effect when Scrolled
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                children: List.generate(6, (index) => GestureDetector(
                  onTap: (){
                    //todo here we will define the things that we need to perform when we tap on the category
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text("Baby Clothing", style: TextStyle(fontFamily: semibold,color: darkFontGrey, ),)),
                )
                )
                            ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              // now we are going to define the grid maker to show the different containers
              Expanded(
                  child: Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,childAspectRatio: 0.8,crossAxisSpacing: 20),
                        itemCount: 10,
                        itemBuilder:(context,index){
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ItemDetails(title: "Sports Products.")),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06),
                                    height: MediaQuery.of(context).size.height*0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(imgP5, height: MediaQuery.of(context).size.height*0.16,fit: BoxFit.cover,),
                                        const Text("Latest Leather Purses", style: TextStyle(fontFamily: bold, color: darkFontGrey),),
                                        SizedBox(height: 5,),
                                        const Text("\$600", style: TextStyle(fontFamily: bold, color: redColor, fontSize: 14),)
                                      ],
                                    ),
                                  ),
                                );
                        }),
                )
              )
           ]
          ),
        ),
      ),
    );
  }
}
