import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppFun {
  static Future<File?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    } else {
      return null;
    }
  }

  static Future<File?> getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    } else {
      return null;
    }
  }
}
