import 'package:cointracker/features/home/application/load_exchange_list.dart';
import 'package:cointracker/features/home/ui/widgets/coin_swiper.dart';
import 'package:cointracker/features/home/ui/widgets/exchange_swiper.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/coin.dart';
import '../../coin_list/application/load_coin_list.dart';
import '../domain/exchange.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Exchange> _exchangeList = [];
  List<Coin> _coinListWinners = [];
  List<Coin> _coinListLosers = [];
  bool _isLoading = true;

  final LoadExchangesListUseCase _loadExchangesListUseCase =
      _getLoadExchangesListUseCase();
  final LoadCoinListUseCase _loadCoinListUseCase = _getLoadCoinListUseCase();

  @override
  void initState() {
    _loadExchangesListUseCase().then((value) {
      _exchangeList = value;
    });

    _loadCoinListUseCase().then((value) {
      _coinListLosers = value;
      _coinListLosers.sort((a, b) {
        return a.priceChange7d.compareTo(b.priceChange7d);
      });

      _coinListWinners = value;
      _coinListWinners.sort((b, a) {
        return b.priceChange7d.compareTo(a.priceChange7d);
      });
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  void _initState() {
    setState(() => _isLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        const Text("TOP WINERS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        coinSwiper(color: Colors.green, coinList: _coinListWinners),
        const Text("TOP LOSERS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        coinSwiper(color: Colors.red, coinList: _coinListLosers),
        const Text("EXCHANGES",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        exchangeSwiper(exchangeList: _exchangeList)
      ],
    );
  }
}

LoadExchangesListUseCase _getLoadExchangesListUseCase() {
  LoadExchangesListUseCase _loadExchangesListUseCase =
      LoadExchangesListUseCase();
  return _loadExchangesListUseCase;
}

LoadCoinListUseCase _getLoadCoinListUseCase() {
  LoadCoinListUseCase _loadCoinListUseCase = LoadCoinListUseCase();
  return _loadCoinListUseCase;
}
