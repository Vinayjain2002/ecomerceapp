import 'package:emart_app/features/shopped/controller/cuponController.dart';
import 'package:emart_app/features/shopped/models/cuponCardsList.dart';
import 'package:emart_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/styles.dart';


Widget CuponContainer({required BuildContext context,required int index}){

  var controller= Get.put(CuponController());


  return Obx(()=> Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal:13, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.4),blurRadius: 5,spreadRadius: 3)
          ]
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.local_offer, color: fontGrey,),
              SizedBox(width: MediaQuery.of(context).size.width*0.12,),
              Text(CuponAviable[index]['heading'],style: const TextStyle(fontFamily: semibold, fontSize: 17),),
            ],
          ),
          const SizedBox(height: 5),
          const Text("Save \$100 with this code",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.blue),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Container(
               padding: const EdgeInsets.all(2),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                 border: Border.all(color: Colors.grey, width: 0.5)
               ),
               child: Text(CuponAviable[index]['cuponName'],style: const TextStyle(color: fontGrey,fontSize: 14),),
             ),
              GestureDetector(
                onTap: (){
                  controller.detailCuponList[index].toggle();
                },
                child: const Text("View Details", style: TextStyle(color: fontGrey,fontSize: 16),),
              )
            ],
          ),
          const SizedBox(height: 5,),
          controller.detailCuponList[index].value? Column(children: <Widget>[
            const SizedBox(height: 5,),
            const Divider(),
            ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,detailindex)=> Container(
                      child: ListTile(
                        dense: true,
                          visualDensity: VisualDensity(vertical: -3), // Adjust the vertical density as needed

                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                        leading: CircleAvatar(radius: 2,backgroundColor: fontGrey,),
                        title:Text(CuponAviable[index]['detail${detailindex+2}'],style: TextStyle(color: darkFontGrey,),maxLines: 2,overflow: TextOverflow.ellipsis,)
                      ),
                    ),
              itemCount: 2,
                ),
            const SizedBox(height: 5,),
            const Divider(),
            const SizedBox(height: 5,)
          ],
          )
              : const Divider(),
          GestureDetector(
            onTap: (){
              for (int i = 0; i < controller.cuponIndexAppliedList.length; i++) {
                if (i != index) {
                  controller.cuponIndexAppliedList[i].value = false;
                }
              }
              controller.cuponIndexAppliedList[index].toggle();
            },
            child: Align(
              alignment: Alignment.center,
              child:  (controller.cuponIndexAppliedList[index].value) ? const Text("✓✓ Applied", style: TextStyle(color: Colors.blue,fontFamily: semibold,fontSize: 16),): const Text("TAP TO APPLY", style: TextStyle(color: Colors.blue,fontSize: 16),),
            ),
          )
        ],
      ),
    ),
  );
}