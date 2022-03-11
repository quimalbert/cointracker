import 'package:cointracker/features/home/ui/home_page.dart';
import 'package:cointracker/features/login/application/check_credentials.dart';
import 'package:cointracker/features/login/infrastructure/biometric_login_local_data_source.dart';
import 'package:cointracker/features/login/ui/widgets/login_textfield.dart';
import 'package:cointracker/features/login/ui/widgets/reset_password.dart';
import 'package:cointracker/shared/application/read_user_data.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/ui/widgets/scaffold_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../shared/application/write_user_data.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  String _email = '', _password = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  late bool _isLoginCorrect;
  bool _isLoading = true;
  late Map<String, dynamic> _userMap;

  final CheckCredentialsUseCase _checkCredentialsUsecase =
      _getCheckCredentialsUseCase();

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    ReadUserDataUseCase().call().then((value) => setState(() {
          _userMap = value;
          if (_userMap["isBiometricEnabled"] != null && _userMap["isBiometricEnabled"]) {
            openBiometricLogin();
          }
          _isLoading = false;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return Center(child: CircularProgressIndicator());

    return ListView(
      children: [
        const SizedBox(height: 40),
        Image.asset('assets/images/logo.png', scale: 1.5),
        LoginTextField(
          hintText: 'Email',
          onChanged: (String value) {
            _email = value;
          },
        ),
        LoginTextField(
          hintText: 'Password',
          onChanged: (String value) {
            _password = value;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 75, left: 75),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () async {
              if (!(_email.isNotEmpty && _password.isNotEmpty)) {
                scaffoldSnackBar(
                  context: context,
                  text: 'Email and Password can' + "'" + 't be empty',
                  isError: true,
                );
                return;
              }
              _isLoginCorrect = await _checkCredentialsUsecase(
                  email: _email, password: _password);

              if (_isLoginCorrect) {
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _email, password: _password);
                if (userCredential != null) {
                  WriteUserDataUseCase().call(
                      email: _email, pictureURL: '', isBiometricEnabled: false);
                  Navigator.pushReplacementNamed(context, HomePage.routeID);
                }
              } else {
                scaffoldSnackBar(
                  context: context,
                  text: 'Wrong credentials',
                  isError: true,
                );
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 100, left: 100),
          child: TextButton(
            child: const Text(
              "Forgotten password?",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 16),
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const ResetPassPage();
                },
              );
            },
          ),
        ),
        SizedBox(
          height: DEVICE_SCREEN_HEIGHT * 0.1,
        ),
        if (_userMap["isBiometricEnabled"] != null &&
            _userMap["isBiometricEnabled"])
          InkWell(
            onTap: openBiometricLogin,
            child: Icon(
              Icons.fingerprint,
              color: Colors.grey,
              size: 80.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
      ],
    );
  }

  Future<void> openBiometricLogin() async {
    final isAuthenticated = await BiometricLogin.authenticate();
    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, HomePage.routeID);
    }
  }
}

CheckCredentialsUseCase _getCheckCredentialsUseCase() {
  CheckCredentialsUseCase _checkCredentialsUseCase = CheckCredentialsUseCase();

  return _checkCredentialsUseCase;
}
