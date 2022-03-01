import 'package:cointracker/features/coin_list/application/load_coin_list.dart';
import 'package:cointracker/features/coin_list/domain/coin.dart';
import 'package:flutter/material.dart';

class CoinListContent extends StatefulWidget {
  const CoinListContent({Key? key}) : super(key: key);

  @override
  State<CoinListContent> createState() => _CoinListContentState();
}

class _CoinListContentState extends State<CoinListContent> {
  List<Coin> _coinList = [];
  bool _isLoading = true;

  final LoadCoinListUseCase _loadCoinListUseCase = _getLoadCoinListUseCase();

  @override
  void initState() {
    _loadCoinListUseCase().then((value) {
      _coinList = value;
      setState(() => _isLoading = false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return CircularProgressIndicator();

    return ListView.builder(
      itemCount: _coinList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_coinList.elementAt(index).name),
        );
      },
    );
  }
}

LoadCoinListUseCase _getLoadCoinListUseCase() {
  LoadCoinListUseCase _loadCoinListUseCase = LoadCoinListUseCase();
  return _loadCoinListUseCase;
}
