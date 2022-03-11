import 'package:cointracker/features/home/domain/exchange.dart';
import 'package:cointracker/features/home/infrastructure/home_remote_data_source.dart';

class LoadExchangesListUseCase {
  final ExchangesRemoteDataSource _exchangesListRemoteDataSource = _getExchangesListRemoteDataSource();

  Future<List<Exchange>> call() async {
    List<Exchange> _exchangeList = await _exchangesListRemoteDataSource.getExchangesList();
    return _exchangeList;
  }
}

ExchangesRemoteDataSource _getExchangesListRemoteDataSource(){
  ExchangesRemoteDataSource _exchangesListRemoteDataSource = ExchangesRemoteDataSource();

  return _exchangesListRemoteDataSource;
}