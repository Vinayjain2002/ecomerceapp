import 'dart:io';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../userData/userInfo.dart';

class ProfileController extends GetxController {
  var imageUrl = "".obs;
  var ProfileImageLink="";

  // going to define the method to change the image
  void changeImage({required context}) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) {
        return;
      } else {
        imageUrl.value = img.path;
      }
    } catch (e) {
      print("error occurred while getting the profile image of the user: $e");
      VxToast.show(context, msg: e.toString());
    }
  }

  // we are going to create a method to store the image of the user
Future<void> uploadProfileImage() async{
    var filename=basename(imageUrl.value);
    var destination='images/$UserUid}/$filename';
    var ref= FirebaseStorage.instance.ref().child(destination);
    final uploadTask= ref.putFile(File(ImageUrl.value));
    await uploadTask.whenComplete(() async {
      try {
        final url = await ref.getDownloadURL();
        print('Image URL: $url');
        // Store the image URL in Firestore or use it as needed
      } catch (error) {
        print('Error fetching download URL: $error');
      }
    });
    ProfileImageLink=await ref.getDownloadURL();
}

}
