import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/firebaseConstants/firebaseConstants.dart';
import 'package:emart_app/userData/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/consts.dart';

class AuthController extends GetxController{
  var isLoading= false.obs;
  var viewDetails=false.obs;

  //login Method with the help of the email and the password. and the firebase authentication.
  Future<String?> loginMethod({
    required BuildContext context,
    required String? emailAddress,
    required String? password,
  }) async {
    FirebaseAuth fireinstance = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await fireinstance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      print("Login successful");

      // Access and return the user's UID
      return userCredential.user?.uid;
    } catch (e) {
      print("Error occurred during login: $e");
      return null; // Return null on failure
    }
  }




  Future<UserCredential?> signUpMethod({required BuildContext context, String? emailAddress, String? password}) async {
    try {
      // Check if the email is already in use
      final existingUser = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress!);
      if (existingUser.isNotEmpty) {
        // User is already signed up, show an error message and return null
        VxToast.show(context, msg: 'The account already exists for that email.');
        return null;
      }

      // If the email is not in use, proceed with creating a new account
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password!,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        VxToast.show(context, msg: 'The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
  // sending the email Link to the User for the verification
  Future<UserCredential?>LoginViaEmail() async{
    try{
      var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
          url: 'https://www.example.com/finishSignUp?cartId=1234',
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'com.example.ios',
          androidPackageName: 'com.example.android',
          // installIfNotAvailable
          androidInstallApp: true,
          // minimumVersion
          androidMinimumVersion: '12');

      var emailAuth = 'someemail@domain.com';
      FirebaseAuth.instance.sendSignInLinkToEmail(
          email: emailAuth, actionCodeSettings: acs)
          .catchError((onError) => print('Error sending email verification $onError'))
          .then((value) => print('Successfully sent email verification'));
    }
    catch(e){
      print(e);
    }
  }

  Future<UserCredential?>ChangeEmailPassword({required email, required password}) async{
    try{
      User? currentUser = FirebaseAuth.instance.currentUser;
      //todo we also need to change the user email also
      await FirebaseAuth.instance.currentUser!.updatePassword(password)
          .then((value) => print("Password updated successfully"))
          .catchError((error) => print("Error updating password: $error"));
    }
    catch(e){
        print("eror occured while changing the user email and the password");
    }
  }
  //todo we need to add the image Url also in the required one and not storing data on the firestone

storeUserData({required context, name, password, email,phoneno}) async{
    try{
      FirebaseFirestore db= FirebaseFirestore.instance;
      DocumentReference store= await db.collection("users").doc(currentUser!.uid);
      store.set({
        'id': currentUser!.uid,
        'name': name,
        'password': password,
        'email': email,
        'phoneno': phoneno,
        'imageUrl': "",
        'cart_count': cart_count,
        "whilist_count": whilist_count,
        "order_count": order_count,
      });
    }
    catch(e){
      print("the eror occured while storing the user data is $e");
      VxToast.show(context, msg: "the error while storing the data is $e");
    }
}

//todo we could also add the founctaity of the phone NO Authentications.
editUserData({required context,required uid,required name,required password,required email,required phoneno,required cartCount,required whilistCount,required orderCount}){
    // going to define the logic to change the user credentials on the firestone
  try{

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference docRef = firestore.collection('users').doc(uid);
    // now we aregoing to change the data on the firestone
    UserName=name; UserEmail= email; UserMobileNo=phoneno; cart_count=cartCount; whilistCount= whilist_count; order_count=orderCount;
    docRef.update(
        {
          'name': name,
          'email': email,
          'cart_count': cartCount,
          'order_count': orderCount,
          'password': password,
          'phoneno': phoneno,
          'order_count': orderCount,
          'whilist_count': whilistCount
        }
    );
    print("Successfully updated the data at the firebase");
  }
  catch(e){
    print("error occured while changing the user data is $e");
  }
}

getUserData({required context, required uid}) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore.collection('users').doc(uid);

      DocumentSnapshot documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data()!;
        var jsonString=jsonEncode(data);
        var mapdata=jsonDecode(jsonString);
        UserName=mapdata['name'];
        cart_count=mapdata['cart_count'];
        order_count=mapdata['order_count'];
        UserUid=mapdata['id'];
        //todo we might also need to fetch the imageUrl from the server.
        whilist_count=mapdata['whilist_count'];
        UserEmail=mapdata['email'];
       UserMobileNo=mapdata['phoneno'];
        return data;
      } else {
        print("Document not found");
        return null;
      }
    } catch (e) {
      print("Error retrieving data: $e");
      return null;
    }
  }

}