import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Home"),
      ],
    );
  }
}
