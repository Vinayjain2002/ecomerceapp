import 'package:emart_app/consts/LIst.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetCommon/HomeButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/featuredButtons.dart';

/// this is going to be the screen where we will place the data that need to be loaded on the Home

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: lightGrey,
        padding: const EdgeInsets.all(12),
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // this is going to be the Search abr of the app
              Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius:
                      BorderRadius.circular(30.0), // Adjust the value as needed
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    isDense: true,
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    prefixIconColor: Colors.grey,
                    hintText: searchAnything,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  //todo we also need to ad teh physics as the Bouncing balls
                  child: Column(
                    children: <Widget>[
                      // now we are going to create the Swipers where we could swipe the latest offers banners
                      /// here the VxSwiper.builder is used because had the founctionality of the automoving
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height * 0.18,
                          enlargeCenterPage: true,
                          itemCount: homeSwiperList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              //todo we need to add the property to the card to make more attractive
                              elevation: 3,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              shadowColor: Colors.grey,
                              child: Image.asset(
                                homeSwiperList[index],
                                fit: BoxFit.fill,
                              ),
                            );
                          }),

                      // we are going to create the home buttons ie the flash sale etc
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
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height * 0.18,
                          enlargeCenterPage: true,
                          itemCount: homeSwiperList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              //todo we need to add the property to the card to make more attractive
                              elevation: 3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shadowColor: Colors.grey,
                              child: Image.asset(
                                homeSecondSwiperList[index],
                                fit: BoxFit.fill,
                              ),
                            );
                          }),

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
                      // going to create the featured Categories
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            featuredCategory,
                            style: TextStyle(
                              color: darkFontGrey,
                              fontSize: 18,
                              fontFamily: bold,
                            ),
                          )),

                      const SizedBox(height: 20),
                      // here we are going to place the featured Buttons
                      SizedBox(
                        height: 200,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                3, // Set the number of items in each row
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // You can replace the following line with your custom widget
                            return featuredButton(
                                context: context,
                                image: featuredImg[index],
                                title: featuredTitles[index]);
                          },
                          itemCount:
                              6, // Set the total number of items in the grid
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: redColor
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(featuredProduct,style: TextStyle(color: Colors.white, fontFamily: bold,fontSize: 18),),

                            const SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    itemBuilder: (BuildContext context,int index,){
                                  return Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(imgP1, width: MediaQuery.of(context).size.width*0.2,fit: BoxFit.fill,),

                                        const SizedBox(height: 10,),
                                        const Text("v", style: TextStyle(fontFamily: semibold, color: darkFontGrey),),

                                        const SizedBox(height: 10,),
                                        const Text("\$600", style: TextStyle(fontFamily: bold, color: redColor, fontSize: 16),)
                                      ],
                                    ),
                                  );
                                })
                              ],
                            ),

                            VxSwiper.builder(aspectRatio: 16/9,
                                autoPlay: true,
                                height: MediaQuery.of(context).size.height*0.18,
                                enlargeCenterPage: true,
                                itemCount: homeSwiperList.length,
                                itemBuilder: (context,index){
                                  return Card(
                                    //todo we need to add the property to the card to make more attractive
                                    elevation: 3,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    shadowColor: Colors.grey,
                                    child: Image.asset(homeSecondSwiperList[index],fit: BoxFit.fill,),
                                  );
                                }
                            ),

                            // we need to create a llproduct SECTION
                            const SizedBox(height: 20,),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 8,
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 8,crossAxisSpacing: 8),
                                itemBuilder: (context,index){
                                  return Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(imgP5, width: MediaQuery.of(context).size.width*0.22,fit: BoxFit.fill,),
                                        const Spacer(),
                                        const SizedBox(height: 10,),
                                        const Text("v", style: TextStyle(fontFamily: semibold, color: darkFontGrey),),

                                        const SizedBox(height: 10,),
                                        const Text("\$600", style: TextStyle(fontFamily: bold, color: redColor, fontSize: 16),)
                                      ],
                                    ),
                                  );
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
