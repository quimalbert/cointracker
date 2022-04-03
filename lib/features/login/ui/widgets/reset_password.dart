import 'package:cointracker/features/login/ui/widgets/login_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/constants.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    String? _resetEmailInput;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Container(
      height: 1200,
      color: backgroundColor,
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Reset your password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "We will send you an email with the next steps required to reset your password.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            LoginTextField(
              isPassword: false,
              hintText: "Introduce your email",
              onChanged: (String value) {
                _resetEmailInput = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 75, left: 75),
              child: ElevatedButton(
                  child: const Text('Send reset code'),
                  onPressed: () {
                    if (_resetEmailInput == null) {
                    } else {
                      auth.sendPasswordResetEmail(email: _resetEmailInput!);
                    }
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
