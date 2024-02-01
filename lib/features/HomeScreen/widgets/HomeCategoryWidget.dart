import 'package:emart_app/utils/constants/colors.dart';
import 'package:emart_app/utils/constants/images.dart';
import 'package:flutter/material.dart';

Widget HomeCategory({required context}){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1),
    padding: const EdgeInsets.symmetric(vertical: 10),
    width: MediaQuery.of(context).size.width*1,
    decoration: BoxDecoration(
      color: lightGrey,
    ),
    child: Column(
      children: <Widget>[
          ListTile(
            leading: Text("End of Season Sale",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06,color: Colors.black87),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 2,
              childAspectRatio: 0.80,
            ),
                itemCount: 4,
                itemBuilder: (context,index)=>Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.black,
                              height: MediaQuery.of(context).size.width*0.4,
                              child: Image.asset(imgP5,fit: BoxFit.fill,)
                          ),
                          const SizedBox(height:10,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Men\'s T-shirt',style: TextStyle(color: fontGrey,fontSize: 16),)),
                          const SizedBox(height: 2,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Min 50% Off', style: TextStyle(color: Colors.green,fontSize: 16),))
                        ],
                      ),
                )
            ),
          )

      ],

    ),
  );
}