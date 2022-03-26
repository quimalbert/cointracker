class ExchangeDetailFactory {
  Map<String, dynamic> fromJson({required List<dynamic> json}) {
    Map<String, dynamic> _exchangeList = {
      "id": "",
    };

    for (Map<String, dynamic> exchangeJson in json) {
      _exchangeList["id"] = "hola";
    }

    return _exchangeList;
  }
}
