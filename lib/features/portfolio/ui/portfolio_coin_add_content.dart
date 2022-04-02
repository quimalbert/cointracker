import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class PortfolioCoinAddContent extends StatefulWidget {
  final List<Coin> coinList;

  const PortfolioCoinAddContent({
    Key? key,
    required this.coinList,
  }) : super(key: key);

  @override
  State<PortfolioCoinAddContent> createState() =>
      _PortfolioCoinAddContentState();
}

class _PortfolioCoinAddContentState extends State<PortfolioCoinAddContent> {
  Coin? _selectedCoin;

  List<Coin> _coinList = [];

  Map<String, dynamic> a = {
    "btc": {
      "buyDate": 1,
      "buyPrice": 100,
      "quantity": 1,
    }
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Coin> _coinList = widget.coinList;
    _coinList.sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.1),
        Center(
          child: DropdownButton<Coin>(
            hint: const Text('Select a Coin'),
            value: _selectedCoin,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: backgroundColor),
            underline: Container(
              height: 2,
              color: backgroundColor,
            ),
            onChanged: (Coin? _newSelectedCoin) {
              if (_newSelectedCoin != null) {
                setState(() => _selectedCoin = _newSelectedCoin);
              }
            },
            items: _coinList.map<DropdownMenuItem<Coin>>((Coin value) {
              return DropdownMenuItem<Coin>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
