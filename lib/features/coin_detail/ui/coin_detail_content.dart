import 'package:flutter/material.dart';

class CoinDetailContent extends StatefulWidget {
  const CoinDetailContent({Key? key}) : super(key: key);
  @override
  State<CoinDetailContent> createState() => _CoinDetailContentState();
}

class _CoinDetailContentState extends State<CoinDetailContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text("Coin Detail"),
      ],
    );
  }
}
