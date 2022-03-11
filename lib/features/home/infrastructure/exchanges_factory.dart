import 'package:cointracker/features/home/domain/exchange.dart';

class ExchangesFactory {
  List<Exchange> fromJson({required List<dynamic> json}) {
    List<Exchange> _coinList = [];

    for (Map<String, dynamic> exchangeJSON in json) {
      _coinList.add(
        Exchange(
          id: exchangeJSON['id'],
          name: exchangeJSON['name'],
          year_established: exchangeJSON['year_established'],
          country: exchangeJSON['country'],
          //description: exchangeJSON['description'],
          url: exchangeJSON['url'],
          image: exchangeJSON['image']
        ),
      );
    }

    return _coinList;
  }
}