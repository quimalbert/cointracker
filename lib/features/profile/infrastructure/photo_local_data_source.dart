import 'package:image_picker/image_picker.dart';

class PhotoRemoteDataSource {
  Future SelectImage async() {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
  TakePhoto() {}
}
