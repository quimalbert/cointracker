import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/exchange.dart';
import 'exchanges_factory.dart';

class ExchangesRemoteDataSource {
  Future<List<Exchange>> getExchangesList() async {
    List<Exchange> _exchangesList = [];

    final _httpResponse = await http.get(
      Uri.parse('https://api.coingecko.com/api/v3/exchanges'),
    );

    _exchangesList = ExchangesFactory().fromJson(json: jsonDecode(_httpResponse.body));

    return _exchangesList;
  }

}


