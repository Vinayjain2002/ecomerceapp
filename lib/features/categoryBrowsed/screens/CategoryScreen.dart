import 'package:emart_app/features/categoryBrowsed/screens/CategoryDetails.dart';
import 'package:emart_app/utils/constants/colors.dart';
import 'package:emart_app/widgetCommon/bgappSmall.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/List.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgAppSmall(
      context: context,
      childWidget: Scaffold(

        appBar: AppBar(
          title: const Text(category, style: TextStyle(fontFamily: bold, color: Colors.white, ),),
          shadowColor: Colors.grey,
          iconTheme: const IconThemeData(color: Colors.white),
          leadingWidth: MediaQuery.of(context).size.width*0.1,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),

          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
      
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing:8, crossAxisSpacing: 8,mainAxisExtent: 193 ),
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    // from this page we are going to create a navigation page ie to the DetailedCategory
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedCategory(title: categorieslist[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10,),
                        Image.asset(categoryImage[index],height: 130,width: 200,fit: BoxFit.cover,),
                        const SizedBox(height: 10,),
                        Text(categorieslist[index],style: const TextStyle(color: darkFontGrey,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                        
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
