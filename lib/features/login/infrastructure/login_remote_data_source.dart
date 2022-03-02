class LoginRemoteDataSource {
  Future<bool> checkCredentials({
    required String email,
    required String password,
  }) async {
    return true;
  }
}
