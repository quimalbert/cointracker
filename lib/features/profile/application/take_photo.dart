import 'dart:io';

import '../infrastructure/photo_local_data_source.dart';

class TakePhotoUseCase {
  PhotoRemoteDataSource _photoRemoteDataSource = _getPhotoRemoteDataSource();

  Future<File> call() async {
    try {
      return await _photoRemoteDataSource.takePhoto();
    } catch (e) {
      throw e;
    }
  }
}

PhotoRemoteDataSource _getPhotoRemoteDataSource() {
  final PhotoRemoteDataSource _photoRemoteDataSource = PhotoRemoteDataSource();
  return _photoRemoteDataSource;
}
