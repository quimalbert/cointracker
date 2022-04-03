import '../infrastructure/photo_local_data_source.dart';

class TakePhotoUseCase {
  final PhotoRemoteDataSource _photoRemoteDataSource =
      _getPhotoRemoteDataSource();

  Future<String?> call() async {
    try {
      return await _photoRemoteDataSource.takePhoto();
    } catch (e) {
      rethrow;
    }
  }
}

PhotoRemoteDataSource _getPhotoRemoteDataSource() {
  final PhotoRemoteDataSource _photoRemoteDataSource = PhotoRemoteDataSource();
  return _photoRemoteDataSource;
}
