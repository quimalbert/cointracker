import 'package:cointracker/shared/domain/exchange.dart';

class ExchangesFactory {
  List<Exchange> fromJson({required List<dynamic> json}) {
    List<Exchange> _exchangeList = [];

    for (Map<String, dynamic> exchangeJson in json) {
      _exchangeList.add(
        Exchange(
          id: exchangeJson['id'],
          name: exchangeJson['name'],
          yearEstablished: exchangeJson['year_established'] ?? 0,
          country: exchangeJson['country'] ?? 'Unknown',
          description: exchangeJson['description'] ?? 'Unknown',
          url: exchangeJson['url'] ?? '',
          imageURL: exchangeJson['image'],
        ),
      );
    }

    return _exchangeList;
  }
}
