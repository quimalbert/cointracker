import 'dart:ui';

import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_avatar_button.dart';
import 'package:cointracker/features/profile/ui/widgets/profile_card.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);
  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BottomSheet(
          onClosing: () {},
          builder: (context) => Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  elevation: defaultElevation,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) => Container(
                      height: 290,
                      child: ListView(
                        children: [
                          AvatarButton(
                            buttonText: "Select from Gallery",
                            buttonIcon: Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            onPressed: () {},
                          ),
                          AvatarButton(
                            buttonText: "Take a beautiful Photo",
                            buttonIcon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )));
            }, // Image tapped
            child: const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://josefernandonieto.com/images/profile-big.jpg'),
                radius: 75,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Text(
          "@" + "SerreSiete",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ProfileCard(
          buttonText: 'Change Password',
          onPressed: () {},
        ),
        ProfileCard(
          buttonText: 'Enable Biometric Login',
          onPressed: () {},
        ),
        ProfileCard(
          buttonText: 'Dark Mode',
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, LoginPage.routeID);
              print("Logout");
            },
            child: Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print("Generate QR");
            },
            child: Text("hola"),
          ),
        )
      ],
    );
  }
}
