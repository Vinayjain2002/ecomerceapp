import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// we are using the image_picker to pick the image from the user device

class ProfileController extends GetxController{
    var imageUrl="".obs;

    // going to define the method to change the image
   void changeImage({required context}) async{
      try{
        final img= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
        if(img==null){
          return;
        }
        else{
          imageUrl=img.path as RxString;
        }
      }
      catch(e){
        print("error occured while getting the profile image of the user is $e");
        VxToast.show(context, msg: e.toString());
      }
    }
}