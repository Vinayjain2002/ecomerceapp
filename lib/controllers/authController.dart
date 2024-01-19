
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/firebaseConstants/firebaseConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../consts/consts.dart';

class AuthController extends GetxController{
  var isLoading= false.obs;

  //login Method with the help of the email and the password. and the firebase authentication.
  Future<UserCredential?> loginMethod({required BuildContext context,required emailAddress, required password}) async{
    UserCredential? userCredential;
    FirebaseAuth fireinstance= FirebaseAuth.instance;
    try {
      final userCredential = await fireinstance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // showing the error with the help of the Vxtoast
        VxToast.show(context, msg: e.toString());
      } else if (e.code == 'wrong-password') {
        VxToast.show(context, msg: e.toString());
      }
      else{
        print("eror while login the user is $e");
      }
      return null;
    }
    return userCredential;
  }



  Future<UserCredential?> signUpMethod(
      {required BuildContext context, String? emailAddress, String? password}) async {
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
// creating method to store the userCredentials to the Server ie which one logged in
  //todo we need to add the image Url also in the required one and not storing data on the firestone

storeUserData({required context, name, password, email,phoneno}) async{
    try{
      FirebaseFirestore db= FirebaseFirestore.instance;
      DocumentReference store= await db.collection("users").doc(currentUser!.uid);
      store.set({
        'name': name,
        'password': password,
        'email': email,
        'phoneno': phoneno,
        'imageUrl': "",
      });
    }
    catch(e){
      print("the eror occured while storing the user data is $e");
      VxToast.show(context, msg: "the error while storing the data is $e");
    }
}

//todo we could also add the founctaity of the phone NO Authentications.

}