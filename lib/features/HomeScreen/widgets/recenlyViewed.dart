import 'package:emart_app/utils/constants/colors.dart';
import 'package:emart_app/utils/constants/consts.dart';
import 'package:flutter/material.dart';
Widget recentlyViewed({required context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: const Text(
          "Recently Viewed Stores",
          style: const TextStyle(
            fontFamily: bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      const SizedBox(height: 5,),
      Container(
        decoration: const BoxDecoration(
          color: lightGrey
        ),
        height: MediaQuery.of(context).size.height * 0.21, // Adjust this height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.32,
            // height: Set a specific height or use MediaQuery for dynamic height,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15, // Set a specific height
                  child: Image.asset(imgB8, fit: BoxFit.fill),
                ),
                const SizedBox(height: 3,),
                const Text(
                  "HeadPhone pouches and case",
                  style: TextStyle(color: darkFontGrey, fontSize: 14,),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
