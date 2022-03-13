import 'package:cointracker/shared/utils/constants.dart';
import 'package:http/http.dart' as http;

class LoadExchangeDetailDataSource {

  Future<List<dynamic>> getExchangeDetail() async {
    List<dynamic> _exchangeDetail = [];
    final _coinListResponses = await http.get(
      Uri.parse(
          'https://pro-api.coinmarketcap.com/v1/exchange/info?slug=binance'),
      headers: {"X-CMC_PRO_API_KEY": apiKey},
    );
    return _exchangeDetail;
  }
}