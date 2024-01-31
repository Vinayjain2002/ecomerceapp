import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/styles.dart';

/// Here we are going to create the featursd Buutons that used to be displayed after the feature

Widget featuredButton({required BuildContext context, String? image, String? title}) {
  return Container(
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: <Widget>[
        Image.asset(image!, width: 60, fit: BoxFit.fill),
        Expanded(
          child: Text(
            title!,
            style: const TextStyle(fontFamily: semibold, color: darkFontGrey),
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}
