import 'package:cointracker/features/home/application/load_exchange_list.dart';
import 'package:cointracker/features/home/ui/widgets/swipers/coin_swiper.dart';
import 'package:cointracker/features/home/ui/widgets/swipers/exchange_swiper.dart';
import 'package:cointracker/shared/application/load_coin_list.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/exchange.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Exchange> _exchangeList = [];
  List<Coin> _coinList = [];
  final List<Coin> _coinListWinners = [];
  final List<Coin> _coinListLosers = [];
  bool _isLoading = true;

  final LoadExchangesListUseCase _loadExchangesListUseCase =
      _getLoadExchangesListUseCase();
  final LoadCoinListUseCase _loadCoinListUseCase = _getLoadCoinListUseCase();

  @override
  void initState() {
    _loadExchangesListUseCase().then((value) {
      _exchangeList = value;

      _loadCoinListUseCase().then((value) {
        _coinList = value;

        for (Coin coin in _coinList) {
          if (coin.priceChange7d > 0) {
            _coinListWinners.add(coin);
          } else {
            _coinListLosers.add(coin);
          }
        }
        setState(() => _isLoading = false);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomCircularProgressIndicator());
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
        const Text(
          "TOP WINNERS",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        CoinSwiper(
          isWinner: true,
          coinList: _coinListWinners,
        ),
        const Text(
          "TOP LOSERS",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        CoinSwiper(
          isWinner: false,
          coinList: _coinListLosers,
        ),
        const Text(
          "EXCHANGES",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        ExchangeSwiper(exchangeList: _exchangeList)
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
