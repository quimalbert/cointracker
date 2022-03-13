import 'package:cointracker/features/exchange_detail/application/load_exchange_detail_use_case.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangeDetail extends StatefulWidget {
  const ExchangeDetail({Key? key}) : super(key: key);
  @override
  State<ExchangeDetail> createState() => _ExchangeDetail();
}

class _ExchangeDetail extends State<ExchangeDetail> {
  List<dynamic> hola = [];
  final LoadExchangeDetailUseCase _loadCoinListUseCase =
      _getLoadExchangeDetailUseCase();

  @override
  void initState() {
    _getLoadExchangeDetailUseCase().call().then((value) {
      hola = value;
    });
    initState();
  }

  Widget build(BuildContext context) {
    final List<String> exchangeInfo =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    final String exchangeName = exchangeInfo.elementAt(0).toString();
    final String imageURL = exchangeInfo.elementAt(1).toString();
    String yearEstablished = exchangeInfo.elementAt(2).toString();
    final String country = exchangeInfo.elementAt(3).toString();
    final String url = exchangeInfo.elementAt(4).toString();

    if (yearEstablished == '0') {
      // UNKNOWN DATA ESTABLISHED
      yearEstablished = '';
    } else {
      yearEstablished = yearEstablished + ' - Actuality';
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.topCenter,
              child:
                  Image.network(imageURL, height: 100.0, fit: BoxFit.contain),
            ),
            Text(
              exchangeName,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              yearEstablished,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              //apply padding to all four sides
              child: Text('Country: ' + country),
            ),
            ElevatedButton(
              child: const Text('URL'),
              onPressed: () => _launchURL(url),
              style: const ButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) {
    launch(url);
  }
}

LoadExchangeDetailUseCase _getLoadExchangeDetailUseCase() {
  LoadExchangeDetailUseCase _loadExchageDetail = LoadExchangeDetailUseCase();
  return _loadExchageDetail;
}
