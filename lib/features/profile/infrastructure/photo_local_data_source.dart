import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:image_picker/image_picker.dart';

class PhotoRemoteDataSource {
  //String hola = "https://api.cloudinary.com/v1_1/atlantis-it/auto/upload";
  Future<String?> _uploadPhoto(File? image) async {
    final cloudinary = Cloudinary(
        "235117647476446", "0vyTICgQX0H5wFTT706Og4XQhWY", "atlantis-it");

    try {
      final response = await cloudinary.uploadFile(
          filePath: image?.path,
          resourceType: CloudinaryResourceType.image,
          folder: "CoinTracker");
      print(response.secureUrl);
    } catch (e) {}
  }

  Future<String?> selectPhoto() async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 250,
        maxHeight: 250,
      );

      final cloudinary = Cloudinary(
          "235117647476446", "0vyTICgQX0H5wFTT706Og4XQhWY", "atlantis-it");

      final response = await cloudinary.uploadFile(
          filePath: pickedFile?.path,
          resourceType: CloudinaryResourceType.image,
          folder: "CoinTracker");
      print(response.secureUrl);
      return response.secureUrl;
    } catch (e) {}
    return '';
  }

  Future<String?> takePhoto() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      String? image_url = await _uploadPhoto(File(image!.path));
      return image_url;
    } catch (e) {
      return '';
    }
  }
}
