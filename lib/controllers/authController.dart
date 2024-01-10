
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/firebaseConstants/firebaseConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController{
  // here it is a authentication controller

  //login Method with the help of the email and the password.
  Future<UserCredential?> loginMethod({required BuildContext context,emailAddress, password}) async{
    UserCredential? userCredential;

    // code for Signin with the help of the email and the password
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // showing the error with the help of the Vxtoast
        VxToast.show(context, msg: e.toString());
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        VxToast.show(context, msg: e.toString());
        print('Wrong password provided for that user.');
      }
    }
    return userCredential;
  }


  // creating a account of the user based on the email adn the password
  Future<UserCredential?>EmailUserRegisteration({required BuildContext context,emailAddress, password}) async{
  try {
  final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        VxToast.show(context, msg: e.toString());
      print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
        VxToast.show(context, msg: e.toString());
      print('The account already exists for that email.');
    }
  } catch (e) {
      print(e);
    }
  }

  // method to Sign out by the User.
  signoutMethod({required BuildContext context}) async{
    //this method is used for the purpose of Signing out the User from the ap
    try{
      await FirebaseAuth.instance.signOut();
    }
    catch(e){
      VxToast.show(context, msg: e.toString());
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
  //todo we need to add the image Url also in the required one

storeUserData({required name, password, email}) async{
    DocumentReference store= await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': "",
    });
}

//todo we could also add the founctaity of the phone NO Authentications.

}