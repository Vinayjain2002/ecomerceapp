
import 'package:emart_app/features/HomeScreen/widgets/HomeCategoryWidget.dart';
import 'package:emart_app/features/HomeScreen/widgets/SearchBar.dart';
import 'package:emart_app/features/HomeScreen/widgets/Swiper.dart';
import 'package:emart_app/features/HomeScreen/widgets/recenlyViewed.dart';
import 'package:emart_app/utils/constants/consts.dart';
import 'package:emart_app/widgetCommon/HomeButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/List.dart';
import '../widgets/featuredButtons.dart';

/// this is going to be the screen where we will place the data that need to be loaded on the Home

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // this is going to be the Search abr of the app
             homeSearchbar(context: context),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              /// we are going to implement the area that need to be scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                      children: <Widget>[
                        Swiper(context: context, swiperList: homeSwiperList),
                                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      homeButtons(
                          icon: icTodaysDeal,
                          title: todaydeal,
                          onPress: () {},
                          width: context.width * 0.42,
                          height: context.height * 0.12),
                      homeButtons(
                          icon: icFlashDeal,
                          title: flashsale,
                          onPress: () {},
                          width: context.width * 0.42,
                          height: context.height * 0.12),
                    ],
                  ),
                        const SizedBox(
                          height: 10,
                        ),
                       Swiper(context: context, swiperList: homeSecondSwiperList),
                        const SizedBox(
                          height: 10,
                        ),
                        // we are going to create the three buttons
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            homeButtons(
                                icon: icTopCategories,
                                title: topcategory,
                                onPress: () {},
                                width: context.width * 0.28,
                                height: context.height * 0.15),
                            homeButtons(
                                icon: icBrands,
                                title: topbrand,
                                onPress: () {},
                                width: context.width * 0.28,
                                height: context.height * 0.15),
                            homeButtons(
                                icon: icTopSeller,
                                title: topseller,
                                onPress: () {},
                                width: context.width * 0.28,
                                height: context.height * 0.15),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        recentlyViewed(context: context),
                        const SizedBox(height: 15,),
                        // going to create the featured Categories
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                featuredCategory,
                                style: TextStyle(
                                  color: darkFontGrey,
                                  fontSize: 18,
                                  fontFamily: bold,
                                ),
                              )),
                        ),
                        const SizedBox(height: 5),
              
                        // we are going to create the home buttons ie the flash sale etc
              
                        // here we are going to place the featured Buttons
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Set the number of items in each row
                              childAspectRatio: 0.4
                            ),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.width,
                                child: featuredButton(
                                  context: context,
                                  image: featuredImg[index],
                                  title: featuredTitles[index],
                                ),
                              );
                            },
                          ),
                        ),
              
                  const SizedBox(height: 5,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: redColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                featuredProduct,
                                style: TextStyle(color: Colors.white, fontFamily: bold, fontSize: 18),
                              ),
                              const SizedBox(height:5),
                              Expanded(child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (BuildContext context,int index){
                                      return Container(
                                        width: MediaQuery.of(context).size.width*0.32,
                                              padding: const EdgeInsets.all(8),
                                              margin: const EdgeInsets.symmetric(horizontal: 4),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Image.asset(imgP1, height: MediaQuery.of(context).size.height*0.12, fit: BoxFit.fill),
                                                    const Text("Laptop 4gb/64gb", style: TextStyle(fontFamily: semibold, color: darkFontGrey)),
                                                    const SizedBox(height: 2),
                                                    const Text("\$600", style: TextStyle(fontFamily: bold, color: redColor, fontSize: 14)),
                                                  ],
                                        ),
                                      );
                                  }
                                )
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8,),
                        HomeCategory(context: context,),
                        // we need to create a llproduct SECTION
                        const SizedBox(height: 20,),
              
                      ],
                  ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
