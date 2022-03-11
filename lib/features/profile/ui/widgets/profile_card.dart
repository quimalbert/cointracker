import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String buttonText;
  final onPressed;

  const ProfileCard({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5),
        elevation: 8,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              title: Text(
                buttonText,
                textAlign: TextAlign.center,
              ),
              //leading: Icon(Icons.admin_panel_settings_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
