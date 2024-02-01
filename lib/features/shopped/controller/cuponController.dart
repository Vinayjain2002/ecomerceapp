import 'package:emart_app/features/authentication/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CuponController extends AuthController{
  var cuponDetails= false.obs;
  List<RxBool> cuponIndexAppliedList = List.generate(5, (index) => false.obs);
  List<RxBool> detailCuponList=List.generate(5, (index) => false.obs);

  var CuponBottomSheet= false.obs;
  var bottomSheetTextField= false.obs;
}