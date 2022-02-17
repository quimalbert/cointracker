import 'package:flutter/material.dart';

class CoinListContent extends StatefulWidget {
  const CoinListContent({Key? key}) : super(key: key);
  @override
  State<CoinListContent> createState() => _CoinListContentState();
}

class _CoinListContentState extends State<CoinListContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Coin List"),
      ],
    );
  }
}
