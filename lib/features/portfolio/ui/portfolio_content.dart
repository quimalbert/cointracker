import 'package:flutter/material.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({Key? key}) : super(key: key);
  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Portolio"),
      ],
    );
  }
}
