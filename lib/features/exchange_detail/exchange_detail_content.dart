import 'package:cointracker/features/exchange_detail/domain/load_exchange_detail_data_source.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/domain/exchange.dart';

class ExchangeDetailContent extends StatefulWidget {
  final Exchange exchange;
  const ExchangeDetailContent({Key? key, required this.exchange})
      : super(key: key);

  @override
  State<ExchangeDetailContent> createState() => _ExchangeDetailContentState();
}

class _ExchangeDetailContentState extends State<ExchangeDetailContent> {
  final LoadExchangeDetailDataSource _loadExchangeDetailDataSource =
      _getExchangeDetailUseCase();

  late Map<String, dynamic> _exchangeDetail;
  bool _isLoading = true;

  @override
  void initState() {
    _isLoading = false;

    _loadExchangeDetailDataSource
        .getExchangeDetail(widget.exchange.id)
        .then((value) {
      _exchangeDetail = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return SafeArea(child: CircularProgressIndicator());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.topCenter,
              child: Image.network(widget.exchange.imageURL,
                  height: 100.0, fit: BoxFit.contain),
            ),
            Text(
              widget.exchange.name,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.exchange.yearEstablished.toString(),
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              //apply padding to all four sides
              child: Text('Country: ' + widget.exchange.country),
            ),
            ElevatedButton(
              child: const Text('URL'),
              onPressed: () => _launchURL(widget.exchange.url),
              style: const ButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String url) {
  launch(url);
}

LoadExchangeDetailDataSource _getExchangeDetailUseCase() {
  LoadExchangeDetailDataSource _exchangeDetailUseCase =
      LoadExchangeDetailDataSource();
  return _exchangeDetailUseCase;
}
