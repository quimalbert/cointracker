import 'package:cointracker/features/home/ui/coin_swiper.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String? _email, _password;
  late bool _isLoginCorrect;

  List<String> coinList = ["Bitcoin", "Ethereum", "Dogecoin", "Binance Coin", "Cardano", "Luna", "Polkadot", "Tether", "Solano", "USDCoin"];
  List<String> exchanges = ["BINANCE", "BINANCE", "BINANCE"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 50),
      children: [
        const Text(
          "TOP WINERS",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
        ),
        coinSwiper(coinList: coinList, color: Colors.green),
        const Text(
            "TOP LOSERS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
        ),
        coinSwiper(coinList: coinList, color: Colors.red),
        const Text(
            "EXCHANGES",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
        ),
        coinSwiper(coinList: coinList, color: Colors.black)
      ],
    );
  }
}
