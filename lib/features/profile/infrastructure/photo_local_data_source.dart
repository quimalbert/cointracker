import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoRemoteDataSource {
  /*
  final cloudinary = CloudinaryPublic(
    "235117647476446",
    "0vyTICgQX0H5wFTT706Og4XQhWY",
    "atlantis-it",
  );*/
  final cloudinary =
      CloudinaryPublic('CLOUD_NAME', 'UPLOAD_PRESET', cache: false);
  //String hola = "https://api.cloudinary.com/v1_1/atlantis-it/auto/upload";
  Future<dynamic> _uploadPhoto(File? image, bool isTake) async {
    if (isTake)
      var image = await ImagePicker().pickImage(source: ImageSource.camera);

    //xºcloudinary.client
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image!.path,
            resourceType: CloudinaryResourceType.Image),
      );

      print(response.secureUrl);
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }
  }

  Future<dynamic> selectPhoto() async {
    try {
      final XFile? xFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      final File imageTemporally = File(xFile!.path);

      _uploadPhoto(imageTemporally, false);
      //pujas al server
      //string
      return Image.file(imageTemporally);
    } catch (e) {
      throw e;
    }
  }

  takePhoto() {}
}