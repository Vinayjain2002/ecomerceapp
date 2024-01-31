import 'package:flutter/material.dart';
import '../utils/constants/styles.dart';

Widget BookItemButton({
  required BuildContext context,
  required String? title,
  required VoidCallback? onPress,
}) {
  return TextButton(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: Colors.red,
    ),
    onPressed: onPress,
    child: Text(
      title!,
      style: TextStyle(
        color: Colors.white,
        fontFamily: bold,
        fontSize: 19,
        letterSpacing: 1,
        wordSpacing: 2
      ),
    ),
  );
}

