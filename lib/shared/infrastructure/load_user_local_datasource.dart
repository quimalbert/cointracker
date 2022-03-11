import 'package:shared_preferences/shared_preferences.dart';

class LoadUserRemoteDataSource {
  //final String emailKey

  Future<void> writeUserData(
      {required String email,
      required String pictureURL,
      required bool isBiometricEnabled}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', email);
    await prefs.setString('profile_picture_url', pictureURL);
    await prefs.setBool('isBiometricEnabled', isBiometricEnabled);
  }

  Future<Map<String, dynamic>> readUserData() async {
    Map<String, dynamic> _userMap = {};
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? _email = prefs.getString('email');
    final String? _pictureURL = prefs.getString('profile_picture_url');
    final bool? _isBiometricEnabled = prefs.getBool('isBiometricEnabled');

    _userMap = {
      "email": _email,
      "pictureURL": _pictureURL,
      "isBiometricEnabled": _isBiometricEnabled,
    };

    return _userMap;
  }
}
