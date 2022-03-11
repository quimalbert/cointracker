import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLogin {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();

    if (!isAvailable) return false;

    return await _auth.authenticate(
        localizedReason: 'Please', useErrorDialogs: true, stickyAuth: true);
  }
}
