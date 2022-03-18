import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/domain/exchange.dart';
import 'exchanges_factory.dart';

class ExchangeRemoteDataSource {
  Future<List<Exchange>> getExchangesList() async {
    List<Exchange> _exchangesList = [];

    final _httpResponse = await http.get(
      Uri.parse('https://api.coingecko.com/api/v3/exchanges'),
    );

    _exchangesList =
        ExchangesFactory().fromJson(json: jsonDecode(_httpResponse.body));

    return _exchangesList;
  }
}
