import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/infrastructure/data_sources/coin_list_remote_data_source.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared/domain/database.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({Key? key}) : super(key: key);

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  late DatabaseService dbs;

  bool _isLoading = true;

  Map<String, dynamic> _portfolioMap = {};
  List<Coin> _coinList = [];

  List<ChartData> _chartData = [];

  late TooltipBehavior _tooltip;

  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();
  late bool _test;
  @override
  void initState() {
    setState(() => _isLoading = true);

    DatabaseService().getUserPortfolio().then((value) {
      _portfolioMap = value;

      DateTime now = new DateTime.now();
      Map<String, Map<String, dynamic>> _coinMap = {
        "btc": {
          "buyDate": now,
          "buyPrice": 100,
          "quantity": 1,
        },
        "eth": {
          "buyDate": now,
          "buyPrice": 100,
          "quantity": 1,
        },
      };
      DatabaseService().addCoinToPortfolio(_coinMap);
      CoinListRemoteDataSource().getCoinList().then((value) {
        _coinList = value;

        for (MapEntry coinEntry in _portfolioMap.entries) {
          Coin _coin = _coinList.firstWhere((element) =>
              element.symbol == coinEntry.key.toString().toUpperCase());

          _chartData.add(
            ChartData(
              coinName: _coin.name,
              value: coinEntry.value['quantity'] * _coin.price,
              color: Color.fromRGBO(9, 0, 136, 1),
            ),
          );
        }

        _tooltip = TooltipBehavior(enable: true, format: 'point.x: \$point.y');

        setState(() => _isLoading = false);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomCircularProgressIndicator());
    }

    return Center(
      child: SfCircularChart(
        tooltipBehavior: _tooltip,
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            enableTooltip: true,
            explode: true,
            dataSource: _chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.coinName,
            yValueMapper: (ChartData data, _) =>
                double.parse(data.value.toStringAsFixed(2)),
          )
        ],
      ),
    );
  }
}

class ChartData {
  final String coinName;
  final double value;
  final Color color;

  ChartData({
    required this.coinName,
    required this.value,
    required this.color,
  });
}
