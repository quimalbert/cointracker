import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDataSource {
  Future<bool> checkCredentials({
    required String email,
    required String password,
  }) async {
    return true;
  }
}
