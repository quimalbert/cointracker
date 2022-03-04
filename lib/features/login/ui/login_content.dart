import 'package:cointracker/features/home/ui/home_page.dart';
import 'package:cointracker/features/login/application/check_credentials.dart';
import 'package:cointracker/features/login/ui/widgets/login_textfield.dart';
import 'package:cointracker/features/login/ui/widgets/reset_password.dart';
import 'package:cointracker/shared/ui/widgets/scaffold_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  String? _email, _password;
  FirebaseAuth auth = FirebaseAuth.instance;
  late bool _isLoginCorrect;

  final CheckCredentialsUseCase _checkCredentialsUsecase =
      _getCheckCredentialsUseCase();

  @override
  Widget build(BuildContext context) {
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
              if (_email == null || _password == null) {
                scaffoldSnackBar(
                  context: context,
                  text: 'Email and Password can' + "'" + 't be empty',
                  isError: true,
                );
                return;
              }
              _isLoginCorrect = await _checkCredentialsUsecase(
                  email: _email!, password: _password!);

              if (_isLoginCorrect) {
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _email!, password: _password!);
                if (userCredential != null) {
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
      ],
    );
  }
}

CheckCredentialsUseCase _getCheckCredentialsUseCase() {
  CheckCredentialsUseCase _checkCredentialsUseCase = CheckCredentialsUseCase();

  return _checkCredentialsUseCase;
}

Future signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
