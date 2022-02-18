import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AvatarButton extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final onPressed;

  const AvatarButton({
    Key? key,
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 20, left: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(25, 25, 25, 1),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          elevation: defaultElevation,
        ),
        onPressed: () {
          onPressed:
          onPressed;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
            Text(
              buttonText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
