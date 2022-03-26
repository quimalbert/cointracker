import 'dart:convert';

import 'package:cointracker/shared/utils/constants.dart';
import 'package:http/http.dart' as http;

class LoadExchangeDetailDataSource {
  Future<Map<String, dynamic>> getExchangeDetail(exchange) async {
    Map<String, dynamic> _exchangeDetail;
    final _httpResponse = await http.get(
      Uri.parse('https://pro-api.coinmarketcap.com/v1/exchange/info?slug=' +
          exchange),
      headers: {"X-CMC_PRO_API_KEY": apiKey},
    );

    return jsonDecode(_httpResponse.body);
  }
}
