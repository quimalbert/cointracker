import 'package:cointracker/features/home/application/load_exchange_list.dart';
import 'package:cointracker/features/home/ui/widgets/coin_swiper.dart';
import 'package:cointracker/features/home/ui/widgets/exchange_swiper.dart';
import 'package:flutter/material.dart';

import '../domain/exchange.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Exchange> _exchangeList = [];
  bool _isLoading = true;

  final LoadExchangesListUseCase _loadExchangesListUseCase = _getLoadExchangesListUseCase();

  @override
  void initState() {
    _loadExchangesListUseCase().then((value) {
      _exchangeList = value;
      setState(() => _isLoading = false);
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        const Text("TOP WINERS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        coinSwiper(color: Colors.green),
        const Text("TOP LOSERS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        coinSwiper(color: Colors.red),
        const Text("EXCHANGES",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        exchangeSwiper(exchangeList: _exchangeList)
      ],
    );
  }
}

LoadExchangesListUseCase _getLoadExchangesListUseCase() {
  LoadExchangesListUseCase _loadExchangesListUseCase = LoadExchangesListUseCase();
  return _loadExchangesListUseCase;
}
