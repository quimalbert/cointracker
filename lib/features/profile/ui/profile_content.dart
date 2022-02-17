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
        Text("Profile"),
      ],
    );
  }
}
