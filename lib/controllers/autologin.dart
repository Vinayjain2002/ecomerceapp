import 'package:emart_app/userData/userInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoLogin extends GetxController {

  Future<void> storedata({
    required String email,
    required String password,
    required String phoneno,
    required String username,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      prefs.setString("email", email);
      prefs.setString("username", username);
      prefs.setString("password", password);
      prefs.setString("phoneno", phoneno);

      // and storing the data inside the UserInfo file for rendering the everywhere
      UserName=username;
      UserEmail=email;
      UserMobileNo=phoneno;
    } catch (e) {
      print("Error occurred while storing user credentials: $e");
      // Handle error appropriately, e.g., display user-friendly message
    }
  }

  Future<void> loggout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance.signOut();
      prefs.remove("isLoggedIn");
      prefs.clear();
    } catch (e) {
      print("Error occurred while logging out: $e");
      // Handle error appropriately
    }
  }
}
