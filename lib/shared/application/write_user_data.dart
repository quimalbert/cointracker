import 'package:cointracker/shared/infrastructure/load_user_local_datasource.dart';

class WriteUserDataUseCase {
  Future<void> call(
      {required String email,
      required String pictureURL,
      required bool isBiometricEnabled}) async {
    await LoadUserRemoteDataSource().writeUserData(
        email: email,
        pictureURL: pictureURL,
        isBiometricEnabled: isBiometricEnabled);
  }
}
