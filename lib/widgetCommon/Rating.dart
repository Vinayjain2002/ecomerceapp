import 'package:flutter/material.dart';

import '../utils/constants/consts.dart';

Widget Rating(){
  return VxRating(
    onRatingUpdate: (value) {
      // Handle rating update

    },
    normalColor: textfieldGrey,
    selectionColor: golden,
    maxRating: 2,
    size: 20,
    count: 5,
    stepInt: true,
  );
}