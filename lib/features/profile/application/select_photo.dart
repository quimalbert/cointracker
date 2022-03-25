import 'dart:io';

import 'package:cointracker/features/profile/infrastructure/photo_local_data_source.dart';

class SelectPhotoUseCase {
  final PhotoRemoteDataSource _photoRemoteDataSource =
      _getPhotoRemoteDataSource();

  Future<File> call() async {
    try {
      return await _photoRemoteDataSource.selectPhoto();
    } catch (e) {
      rethrow;
    }
  }
}

PhotoRemoteDataSource _getPhotoRemoteDataSource() {
  final PhotoRemoteDataSource _photoRemoteDataSource = PhotoRemoteDataSource();
  return _photoRemoteDataSource;
}
