import 'package:flutter/material.dart';

import '../../../../shared/utils/constants.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: backgroundColor,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              title: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              //leading: Icon(Icons.admin_panel_settings_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
