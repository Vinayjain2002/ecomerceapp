import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget CartItem({required context}) {
  return Column(
    children: [
      Row(
        children: <Widget>[
          Image.asset(imgB1),
          SizedBox(width: 10), // Add some spacing between the image and the other content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nova NHP 8100/05 Hair Dryer",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "1200 W, Black, Blue",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                SizedBox(height: 5),
                VxRating(
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  maxRating: 5,
                  size: 25,
                  stepInt: true,
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: "41% off ",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(text: " \$845 ", style: TextStyle(color: fontGrey)),
                      TextSpan(text: " \$494 ", style: TextStyle(fontSize: 17, fontFamily: bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      ),
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust spacing as needed
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 2),  // Left border
                  right: BorderSide(color: Colors.grey, width: 2), // Right border
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.bookmark,size: 20,color: Colors.black54,),
                  Text("Save for later",style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete_outline,size: 20,color: Colors.black54,),
                  Text("Remove",style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 2),  // Left border
                  right: BorderSide(color: Colors.grey, width: 2), // Right border
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart,size: 20,color: Colors.black54,),
                  Text("Check it Out",style: TextStyle(fontSize: 16, color: Colors.black54),softWrap: true,)
                ],
              ),
            ),
          ),

        ],
      ),
    ],
  );
}
