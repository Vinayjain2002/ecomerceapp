import 'package:emart_app/widgetCommon/Rating.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';

Widget CartItem({required context, required productName, required productDetail, required offerPrice, required oldPrice, required newPrice,required itemImage}) {
  return Column(
    children: [
      Row(
        children: <Widget>[
          Image.asset(itemImage),
          const SizedBox(width: 10), // Add some spacing between the image and the other content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  productName,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  productDetail,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Rating(),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: offerPrice,
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(text: "  \$$oldPrice", style: const TextStyle(color: fontGrey)),
                      TextSpan(text: "  \$$newPrice", style: const TextStyle(fontSize: 17, fontFamily: bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      ),
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust spacing as needed
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 2),  // Left border
                  right: BorderSide(color: Colors.grey, width: 2), // Right border
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.bookmark,size: 20,color: Colors.black54,),
                  Text(saveforlater,style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
                ],
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: (){},
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     child: const Row(
          //       children: <Widget>[
          //         Icon(Icons.delete_outline,size: 20,color: Colors.black54,),
          //         Text(remove,style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: (){},
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     decoration: const BoxDecoration(
          //       border: Border(
          //         left: BorderSide(color: Colors.grey, width: 2),  // Left border
          //         right: BorderSide(color: Colors.grey, width: 2), // Right border
          //       ),
          //     ),
          //     child: const Row(
          //       children: <Widget>[
          //         Icon(Icons.shopping_cart,size: 20,color: Colors.black54,),
          //         Text(checkout,style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
          //       ],
          //     ),
          //   ),
          // ),

        ],
      ),
    ],
  );
}
