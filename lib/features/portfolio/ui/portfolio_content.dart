import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/infrastructure/data_sources/coin_list_remote_data_source.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
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
  List<Coin> _portfolioCoinList = [];

  List<ChartData> _chartData = [];

  late TooltipBehavior _tooltip;

  final List<Color> _colorList = [
    Colors.blueAccent,
    Colors.green,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.deepPurpleAccent,
    Colors.yellowAccent,
    Colors.white,
  ];
  late bool _test;
  @override
  void initState() {
    _initState();

    super.initState();
  }

  void _initState() {
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

        if (_portfolioMap.isNotEmpty) {
          int _index = 0;
          for (MapEntry coinEntry in _portfolioMap.entries) {
            Coin _coin = _coinList.firstWhere((element) =>
                element.symbol == coinEntry.key.toString().toUpperCase());

            _portfolioCoinList.add(_coin);

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

          _tooltip =
              TooltipBehavior(enable: true, format: 'point.x: \$point.y');
        }

        setState(() => _isLoading = false);
      });
    });
  }

  Future<void> _refresh() async {
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CustomCircularProgressIndicator());
    }

    if (_portfolioCoinList.isEmpty) {
      return RefreshIndicator(
        onRefresh: _refresh,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Text('Your Portfolio is empty!'),
          ),
        ),
      );
    }

    return RefreshIndicator(
      color: Colors.red,
      onRefresh: _refresh,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SfCircularChart(
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
                ),
              ],
            ),
            const Text(
              'Your assets',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _portfolioCoinList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.02),
                    Text(
                      _portfolioCoinList.elementAt(index).name,
                      style: TextStyle(
                        fontSize: 16,
                        color: _colorList[index],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(_portfolioMap.entries
                            .elementAt(index)
                            .value['quantity']
                            .toString() +
                        ' ' +
                        _portfolioMap.entries
                            .elementAt(index)
                            .key
                            .toUpperCase()),
                    Text('\$' +
                        (_portfolioMap.entries
                                    .elementAt(index)
                                    .value['quantity'] *
                                _coinList.elementAt(index).price)
                            .toString()),
                  ],
                );
              },
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
          ],
        ),
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
