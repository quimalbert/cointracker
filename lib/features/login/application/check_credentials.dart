import 'package:cointracker/features/login/infrastructure/login_remote_data_source.dart';

class CheckCredentialsUseCase {
  final LoginRemoteDataSource _loginRemoteDataSource =
      _getLoginRemoteDataSource();

  Future<bool> call({
    required String email,
    required String password,
  }) async {
    return await _loginRemoteDataSource.checkCredentials(
        email: email, password: password);
  }
}

LoginRemoteDataSource _getLoginRemoteDataSource() {
  LoginRemoteDataSource _loginRemoteDataSource = LoginRemoteDataSource();

  return _loginRemoteDataSource;
}
