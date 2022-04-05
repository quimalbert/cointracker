import 'dart:convert';
import 'package:cointracker/features/portfolio/ui/portfolio_coin_add_page.dart';
import 'package:cointracker/features/portfolio/ui/qr_scanner.dart';
import 'package:cointracker/features/portfolio/ui/widgets/portfolio_chart.dart';
import 'package:cointracker/features/portfolio/ui/widgets/portfolio_coin_card.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/infrastructure/data_sources/coin_list_remote_data_source.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:cointracker/shared/ui/widgets/scaffold_snackbar.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../shared/application/read_user_data.dart';
import '../../../shared/domain/database.dart';
import '../domain/char_data.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({Key? key}) : super(key: key);

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  late DatabaseService dbs;

  bool _isLoading = true;

  late Map<String, dynamic> _portfolioMap;
  late List<Coin> _coinList;
  late List<Coin> _portfolioCoinList;

  late List<ChartData> _chartData;

  late String _email;

  late TooltipBehavior _tooltip;

  final List<Color> _colorList = [
    Colors.orangeAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.green,
    Colors.blueAccent,
    Colors.blue,
    Colors.purple,
    Colors.purpleAccent,
    Colors.pink,
    Colors.redAccent,
  ];

  late double _portfolioTotalValue;

  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();

  @override
  void initState() {
    super.initState();

    _initState();
  }

  void _initState() {
    setState(() => _isLoading = true);

    _portfolioTotalValue = 0;
    _portfolioMap = {};
    _coinList = [];
    _portfolioCoinList = [];
    _chartData = [];

    DatabaseService().getUserPortfolio().then((value) {
      _portfolioMap = value;

      ReadUserDataUseCase().call().then((value) {
        _email = value['email'];
      });

      CoinListRemoteDataSource().getCoinList().then((value) {
        _coinList = value;

        if (_portfolioMap.isNotEmpty) {
          int _index = 0;
          for (MapEntry coinEntry in _portfolioMap.entries) {
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

            if (_index < _colorList.length - 1) {
              _index++;
            } else {
              _index = 0;
            }
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
      return Column(
        children: [
          SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.02),
          const Text(
            'Your Portfolio is empty!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: backgroundColor,
              fontSize: 20,
            ),
          ),
          SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You could start adding new coins...',
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                tooltip: 'Add new Coin',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PortfolioCoinAddPage.routeID,
                    arguments: [_coinList, _portfolioMap],
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'or scan another Portfolio!',
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                tooltip: 'Scan a Portfolio QR',
                icon: const Icon(
                  Icons.qr_code_scanner,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, QRScanner.routeID);
                },
                color: backgroundColor,
              ),
            ],
          ),
        ],
      );
    }

    return RefreshIndicator(
      color: Colors.red,
      onRefresh: _refresh,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.02),
            Text(
              'Your portfolio total value: ' +
                  _formatCurrency.format(_portfolioTotalValue),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: backgroundColor,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Show your Portfolio QR',
                  icon: const Icon(
                    Icons.qr_code,
                    size: 32,
                  ),
                  onPressed: () {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      showQRDialog(context);
                    });
                  },
                  color: backgroundColor,
                ),
                IconButton(
                  tooltip: 'Scan a Portfolio QR',
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, QRScanner.routeID);
                  },
                  color: backgroundColor,
                ),
              ],
            ),
            PortfolioChart(tooltipBehavior: _tooltip, chartData: _chartData),
            const Text(
              'Your assets',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: backgroundColor,
              ),
            ),
            IconButton(
              tooltip: 'Add new Coin',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PortfolioCoinAddPage.routeID,
                  arguments: [_coinList, _portfolioMap],
                );
              },
              icon: const Icon(
                Icons.add,
                size: 32,
              ),
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _portfolioCoinList.length,
              itemBuilder: (context, index) {
                return PortfolioCoinCard(
                  quantity: double.parse(_portfolioMap.entries
                      .elementAt(index)
                      .value['quantity']
                      .toString()),
                  coin: _portfolioCoinList.elementAt(index),
                  onDeleteButtonTapped: () {
                    showDeleteAlertDialog(
                      context,
                      _portfolioCoinList.elementAt(index).name,
                      index,
                    );
                  },
                );
              },
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
          ],
        ),
      ),
    );
  }

  showDeleteAlertDialog(BuildContext context, String coinName, int index) {
    Widget yesButton = TextButton(
      child: const Text(
        'Yes',
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () async {
        _portfolioMap.removeWhere(
            (key, value) => key == _portfolioMap.entries.elementAt(index).key);

        await DatabaseService().setPortfolio(_portfolioMap);

        Navigator.pop(context);

        scaffoldSnackBar(
            context: context,
            text: coinName + ' deleted from your Portfolio',
            isError: false);

        _initState();
      },
    );

    Widget noButton = TextButton(
      child: const Text(
        'No',
        style: TextStyle(color: Colors.redAccent),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Delete ' + coinName),
      content: Text('Are you sure you want to delete ' +
          coinName +
          ' from your Portfolio?'),
      actions: [noButton, yesButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showQRDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        width: 500,
        height: 500,
        child: QrImage(
          data: jsonEncode([_email, _portfolioMap]),
          version: QrVersions.auto,
          size: 250,
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
