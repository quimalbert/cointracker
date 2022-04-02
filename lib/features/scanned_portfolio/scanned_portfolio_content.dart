import 'package:cointracker/features/portfolio/ui/widgets/portfolio_chart.dart';
import 'package:cointracker/features/scanned_portfolio/widgets/scanned_portfolio_coin_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../shared/domain/coin.dart';
import '../../shared/infrastructure/data_sources/coin_list_remote_data_source.dart';
import '../../shared/ui/styles.dart';
import '../../shared/ui/widgets/custom_circular_progress_indicator.dart';
import '../../shared/utils/constants.dart';
import '../portfolio/domain/char_data.dart';

class ScannedPortfolioContent extends StatefulWidget {
  final String email;
  final Map portfolioMap;

  const ScannedPortfolioContent({
    Key? key,
    required this.email,
    required this.portfolioMap,
  }) : super(key: key);

  @override
  State<ScannedPortfolioContent> createState() =>
      _ScannedPortfolioContentState();
}

class _ScannedPortfolioContentState extends State<ScannedPortfolioContent> {
  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();

  bool _isLoading = true;

  late double _portfolioTotalValue;

  final List<Color> _colorList = [
    Colors.blueAccent,
    Colors.green,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.deepPurpleAccent,
    Colors.yellowAccent,
  ];

  late List<Coin> _coinList;
  late List<Coin> _portfolioCoinList;

  late List<ChartData> _chartData;

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    setState(() => _isLoading = true);

    _portfolioTotalValue = 0;
    _coinList = [];
    _portfolioCoinList = [];
    _chartData = [];

    CoinListRemoteDataSource().getCoinList().then((value) {
      _coinList = value;

      if (widget.portfolioMap.isNotEmpty) {
        int _index = 0;
        for (MapEntry coinEntry in widget.portfolioMap.entries) {
          Coin _coin = _coinList.firstWhere((element) =>
              element.symbol == coinEntry.key.toString().toUpperCase());

          _portfolioCoinList.add(_coin);

          _portfolioTotalValue += coinEntry.value['quantity'] * _coin.price;

          _chartData.add(
            ChartData(
              coinName: _coin.name,
              value: coinEntry.value['quantity'] * _coin.price,
              color: _colorList.elementAt(_index),
            ),
          );

          if (_index < _colorList.length)
            _index++;
          else
            _index = 0;
        }

        _tooltip = TooltipBehavior(enable: true, format: 'point.x: \$point.y');
      }

      setState(() => _isLoading = false);
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
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.02),
        Text(
          widget.email +
              ' portfolio total value: ' +
              _formatCurrency.format(_portfolioTotalValue),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: backgroundColor,
            fontSize: 20,
          ),
        ),
        PortfolioChart(tooltipBehavior: _tooltip, chartData: _chartData),
        Text(
          widget.email + ' assets',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: backgroundColor,
          ),
        ),
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _portfolioCoinList.length,
          itemBuilder: (context, index) {
            return ScannedPortfolioCoinCard(
              quantity: double.parse(widget.portfolioMap.entries
                  .elementAt(index)
                  .value['quantity']
                  .toString()),
              coin: _portfolioCoinList.elementAt(index),
            );
          },
        ),
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
      ],
    );
  }
}
