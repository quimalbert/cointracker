import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/domain/database.dart';
import '../../../shared/ui/widgets/scaffold_snackbar.dart';

class PortfolioCoinAddContent extends StatefulWidget {
  final List<Coin> coinList;
  final Map<String, dynamic> portfolioMap;

  const PortfolioCoinAddContent({
    Key? key,
    required this.coinList,
    required this.portfolioMap,
  }) : super(key: key);

  @override
  State<PortfolioCoinAddContent> createState() =>
      _PortfolioCoinAddContentState();
}

class _PortfolioCoinAddContentState extends State<PortfolioCoinAddContent> {
  Coin? _selectedCoin;

  double? _quantity;

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
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.25),
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
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.05),
        Padding(
          padding: EdgeInsets.only(
            right: DEVICE_SCREEN_WIDTH * 0.2,
            left: DEVICE_SCREEN_WIDTH * 0.2,
          ),
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ],
            onChanged: (String value) {
              try {
                _quantity = double.parse(value);
              } catch (e) {
                _quantity = null;
              }
            },
            style: const TextStyle(color: backgroundColor),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor, width: 1.0),
              ),
              hintText: 'Quantity',
              hintStyle: TextStyle(color: backgroundColor),
            ),
          ),
        ),
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.05),
        Padding(
          padding: EdgeInsets.only(
            right: DEVICE_SCREEN_WIDTH * 0.2,
            left: DEVICE_SCREEN_WIDTH * 0.2,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text('Add Coin'),
            onPressed: () async {
              if (_selectedCoin != null && _quantity != null) {
                Map<String, dynamic> _portfolioMap = widget.portfolioMap;

                _portfolioMap[_selectedCoin!.symbol] = {
                  "buyDate": DateTime.now().millisecondsSinceEpoch,
                  "buyPrice": _selectedCoin!.price,
                  "quantity": _quantity,
                };

                await DatabaseService().setPortfolio(_portfolioMap);

                scaffoldSnackBar(
                    context: context,
                    text: 'Added ' + _selectedCoin!.name + ' to your Portfolio',
                    isError: false);

                Navigator.of(context).pushNamedAndRemoveUntil(
                    PortfolioPage.routeID, (Route<dynamic> route) => false);
              } else {
                scaffoldSnackBar(
                    context: context,
                    text: 'Select a Coin and insert a valid quantity',
                    isError: true);
              }
            },
          ),
        ),
      ],
    );
  }
}
