import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

/// This is going to be the text fields where the user could enter their details
//todo we need to define a eye that will allow to see the password entered by the user
Widget CustomTextField({
  required BuildContext context,
  String? title,
  String? hintText,
  TextEditingController? controller,
}) {
 bool protectedText=false;
 if(title=="Password" || title==retypepassword){
   protectedText=true;
 }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title!,
        style: const TextStyle(color: redColor, fontFamily: semibold, fontSize: 16,fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 5),

      // Now we are going to place the text field for the email
      TextFormField(
        obscureText: protectedText,
        controller: controller, // Assigned the provided controller to the TextFormField
        decoration: InputDecoration(

          hintText: hintText!,
          hintStyle: const TextStyle(
            fontFamily: bold,
            color: Colors.grey,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:  OutlineInputBorder(
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
