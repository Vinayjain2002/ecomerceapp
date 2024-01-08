import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

/// This is going to be the text fields where the user could enter their details
Widget CustomTextField({
  required BuildContext context,
  String? title,
  String? hintText,
  TextEditingController? controller, // Corrected the type of the controller parameter
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title!,
        style: const TextStyle(color: redColor, fontFamily: semibold, fontSize: 16),
      ),
      const SizedBox(height: 5),

      // Now we are going to place the text field for the email
      TextFormField(
        controller: controller, // Assigned the provided controller to the TextFormField
        decoration: InputDecoration(
          hintText: hintText!,
          hintStyle: const TextStyle(
            fontFamily: bold,
            color: textfieldGrey,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
        ),
      ),

      const SizedBox(height: 5,),
    ],
  );
}
