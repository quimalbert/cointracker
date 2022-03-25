import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnableBiometricConfirmation extends StatelessWidget {
  final String textMessage, titleText;

  const EnableBiometricConfirmation(
      {required this.textMessage, required this.titleText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((16))),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, textMessage, titleText),
    );
  }
}

dialogContent(BuildContext context, String textMessage, String titleText) {
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
              titleText,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              textMessage,
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
      const Positioned(
        top: 0,
        left: 16,
        right: 16,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 50,
          backgroundImage: AssetImage(
            'assets/images/biometric_login.jpg',
          ),
        ),
      ),
    ],
  );
}
