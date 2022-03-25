import 'package:cointracker/features/coin_list/ui/widgets/coin_list_card.dart';
import 'package:cointracker/shared/application/load_coin_list.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class CoinListContent extends StatefulWidget {
  const CoinListContent({Key? key}) : super(key: key);

  @override
  State<CoinListContent> createState() => _CoinListContentState();
}

class _CoinListContentState extends State<CoinListContent> {
  List<Coin> _coinList = [];
  late bool _isLoading;

  final LoadCoinListUseCase _loadCoinListUseCase = _getLoadCoinListUseCase();

  @override
  void initState() {
    _initState();

    super.initState();
  }

  void _initState() {
    setState(() => _isLoading = true);

    _loadCoinListUseCase().then((value) {
      _coinList = value;

      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomCircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _coinList.length,
          itemBuilder: (context, index) => CoinListCard(
              coin: _coinList.elementAt(index),
              leadingText: _coinList.elementAt(index).name +
                  ' / ' +
                  _coinList.elementAt(index).symbol,
              trailingText:
                  '\$' + _coinList.elementAt(index).price.toStringAsFixed(2),
              hasIncrease: _coinList.elementAt(index).priceChange24h >= 0)),
    );
  }

  Future<void> _refresh() async {
    _initState();
  }
}

LoadCoinListUseCase _getLoadCoinListUseCase() {
  LoadCoinListUseCase _loadCoinListUseCase = LoadCoinListUseCase();
  return _loadCoinListUseCase;
}
