import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/styles.dart';

Widget homeSearchbar({required context}){
  return   Container(
    height: 50,
    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: lightGrey,
      borderRadius:
      BorderRadius.circular(30.0), // Adjust the value as needed
    ),
    child: TextFormField(
      decoration:  InputDecoration(
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        fillColor: Colors.grey.withOpacity(0.2),
        prefixIcon: const Icon(
          Icons.search,
          size: 26,
          color: fontGrey,
        ),
        prefixIconColor: Colors.grey,
        hintText: searchAnything,
        hintStyle: const TextStyle(
          fontFamily: bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}