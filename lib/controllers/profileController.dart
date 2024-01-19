import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../userData/userInfo.dart';

class ProfileController extends GetxController {
  var imageUrl = "".obs;

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
}
