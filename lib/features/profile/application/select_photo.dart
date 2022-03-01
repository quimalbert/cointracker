import 'package:cointracker/features/profile/infrastructure/photo_local_data_source.dart';

class SelectPhotoUseCase {
  PhotoRemoteDataSource _photoRemoteDataSource = _getPhotoRemoteDataSource();

  Future<void> call() async {
    try {
      return await _photoRemoteDataSource.selectPhoto();
    } catch (e) {
      throw e;
    }
  }
}

PhotoRemoteDataSource _getPhotoRemoteDataSource() {
  final PhotoRemoteDataSource _photoRemoteDataSource = PhotoRemoteDataSource();
  return _photoRemoteDataSource;
}
