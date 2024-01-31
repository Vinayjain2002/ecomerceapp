import 'package:flutter/material.dart';

import '../../../utils/constants/consts.dart';

Widget Swiper({required context,required swiperList}){
  return VxSwiper.builder(
      aspectRatio: 17/ 9,
      autoPlay: true,
      height: MediaQuery.of(context).size.height * 0.18,
      enlargeCenterPage: true,
      itemCount: swiperList.length,
      itemBuilder: (context, index) {
        return Card(
          //todo we need to add the property to the card to make more attractive
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          shadowColor: Colors.grey,
          child: Image.asset(
            swiperList[index],
            fit: BoxFit.fill,
          ),
        );
      });
}