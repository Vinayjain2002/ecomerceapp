import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/authentication/controller/authController.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/styles.dart';

Widget CuponContainer({required BuildContext context}){

  var controller= Get.put(AuthController());


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
              const Text("50% Off upto \$100",style: TextStyle(fontFamily: semibold, fontSize: 16),),
            ],
          ),
          const SizedBox(height: 5),
          const Text("Save \$100 with this code",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                  ),
                  onPressed: (){}, child: const Text("Summer",style: TextStyle(color: Colors.black),)),
              GestureDetector(
                onTap: (){
                  controller.isLoading.toggle();
                },
                child: const Text("View Details", style: TextStyle(color: fontGrey),),
              )
            ],
          ),
          //todo here we are going to define the code that contains the code that show the detailed Description
          // here it is going to be defined
          const Divider(),
          GestureDetector(
            onTap: (){
              controller.tapToApply.toggle();
            },
            child: Align(
              alignment: Alignment.center,
              child: controller.tapToApply.value ? const Text("Applied", style: TextStyle(color: Colors.blue),): const Text("TAP TO APPLY", style: TextStyle(color: Colors.blue),),
            ),
          )
        ],
      ),
    ),
  );
}