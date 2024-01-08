import 'package:emart_app/CartScreen/CartScreen.dart';
import 'package:emart_app/HomeScreen/HomeScreen.dart';
import 'package:emart_app/accountAuthScreen/AccountScreen.dart';
import 'package:emart_app/categoryScreen/CategoryScreen.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/images.dart';
import '../../consts/strings.dart';

/// this is going to be the home screen of the app


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    // here the controller is used for the purpose of the getting the index of the selected NavigationBottom
    var Controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26), label: category),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody=[
        HomeScreen(),
        CategoryScreen(),
        CartScreen(),
        AccountScreen(),
    ];
    return Scaffold(

      // so it will load the data on the body part according to on that part the user had pressed.
      body: Column(
        children: [
          Obx(
          ()=> Expanded(
              child: navBody.elementAt(Controller.currNavindex.value),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Obx(
          ()=>BottomNavigationBar(
            currentIndex: Controller.currNavindex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            backgroundColor: Colors.white,
            items: navBarItem,
            onTap: (value){
              Controller.currNavindex.value=value;
            },
          ),

      )
    );
  }
}

