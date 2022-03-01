import 'package:cointracker/shared/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordConfirmation extends StatelessWidget {
  const ChangePasswordConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((16))),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _email;
  if (auth.currentUser?.email != null) {
    _email = auth.currentUser?.email;
  } else {
    _email = "null";
  }
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 100, bottom: 16, right: 16, left: 16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  color: backgroundColor,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Check your email!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "We have sent you an email to: " +
                  _email! +
                  ". Check your inbox, and follow the steps to reset your password.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay!"),
              ),
            )
          ],
        ),
      ),
      Positioned(
        top: 0,
        left: 16,
        right: 16,
        child: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 50,
          backgroundImage: AssetImage(
            'assets/images/email_organizacional.png',
          ),
        ),
      )
    ],
  );
}
