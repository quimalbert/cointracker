import 'package:cointracker/features/coin_list/domain/coin.dart';

class CoinFactory {
  List<Coin> fromJson({required List<dynamic> json}) {
    List<Coin> _coinList = [];

    for (Map<String, dynamic> coinJson in json) {
      _coinList.add(
        Coin(
          id: coinJson['id'],
          name: coinJson['name'],
          symbol: coinJson['symbol'],
          maxSupply: coinJson['max_supply'],
          currentSupply:
              double.parse(coinJson['circulating_supply'].toString()),
          protocolType:
              coinJson['tags'].length == 2 ? coinJson['tags'][1] : null,
          marketRank: coinJson['cmc_rank'],
          marketCap: coinJson['quote']['USD']['market_cap'],
          marketCapDominance: coinJson['quote']['USD']['market_cap_dominance'],
          fullyDilutedMarketCap: double.parse(
              coinJson['quote']['USD']['fully_diluted_market_cap'].toString()),
          volume24h: coinJson['quote']['USD']['volume_24h'],
          volumeChange24h: coinJson['quote']['USD']['volume_change_24h'],
          price: coinJson['quote']['USD']['price'],
          priceChange1h: coinJson['quote']['USD']['percent_change_1h'],
          priceChange24h: coinJson['quote']['USD']['percent_change_24h'],
          priceChange7d: coinJson['quote']['USD']['percent_change_7d'],
          priceChange30d: coinJson['quote']['USD']['percent_change_30d'],
          priceChange60d: coinJson['quote']['USD']['percent_change_60d'],
          priceChange90d: coinJson['quote']['USD']['percent_change_90d'],
        ),
      );
    }

    return _coinList;
  }
}
