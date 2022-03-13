import 'dart:convert';

import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/infrastructure/models/coin_factory.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:http/http.dart' as http;

class CoinListRemoteDataSource {
  Future<List<Coin>> getCoinList() async {
    List<Coin> _coinList = [];

    final _coinListResponse = await http.get(
      Uri.parse(
          'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100'),
      headers: {"X-CMC_PRO_API_KEY": apiKey},
    );
    /*
    NO BORRAR PROVES ARNAU
    final _coinListResponses = await http.get(
      Uri.parse(
          'https://pro-api.coinmarketcap.com/v1/exchange/info?slug=binance'),
      headers: {"X-CMC_PRO_API_KEY": apiKey},
    );

    final _coinListResponses = await http.get(
      Uri.parse('https://pro-api.coinmarketcap.com/v1/exchange/map?limit=100'),
      headers: {"X-CMC_PRO_API_KEY": apiKey},
    );
    
     */
    _coinList = CoinFactory()
        .fromJson(json: jsonDecode(_coinListResponse.body)["data"]);

    return _coinList;
  }
}
