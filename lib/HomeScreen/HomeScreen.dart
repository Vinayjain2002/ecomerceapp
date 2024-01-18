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

              /// we are going to implement the area that need to be scrollable
              Expanded(
                  child: ListView(
                      children: <Widget>[
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

                  const SizedBox(height: 10,),
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
                              const SizedBox(height: 10),
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
                        const SizedBox(height: 20,),
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

                        //todo the gridView builder si left to be implemented

                        // GridView.builder(
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: 2,
                        //     shrinkWrap: true,
                        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 8,crossAxisSpacing: 8),
                        //     itemBuilder: (context,index){
                        //       return Container(
                        //         height: 300,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(15),
                        //           color: Colors.white,
                        //         ),
                        //         child:  Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Image.asset(imgP5, width: MediaQuery.of(context).size.width*0.22,fit: BoxFit.fill,),
                        //             const Spacer(),
                        //             const SizedBox(height: 10,),
                        //             const Text("v", style: TextStyle(fontFamily: semibold, color: darkFontGrey),),
                        //
                        //             const SizedBox(height: 10,),
                        //             const Text("\$600", style: TextStyle(fontFamily: bold, color: redColor, fontSize: 16),)
                        //           ],
                        //         ),
                        //       );
                        //     })
                      ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
