import 'package:cointracker/features/home/infrastructure/exchange_remote_data_source.dart';
import 'package:cointracker/shared/domain/exchange.dart';

class LoadExchangesListUseCase {
  final ExchangeRemoteDataSource _exchangesListRemoteDataSource =
      _getExchangesListRemoteDataSource();

  Future<List<Exchange>> call() async {
    List<Exchange> _exchangeList =
        await _exchangesListRemoteDataSource.getExchangesList();
    return _exchangeList;
  }
}

ExchangeRemoteDataSource _getExchangesListRemoteDataSource() {
  ExchangeRemoteDataSource _exchangesListRemoteDataSource =
      ExchangeRemoteDataSource();

  return _exchangesListRemoteDataSource;
}
