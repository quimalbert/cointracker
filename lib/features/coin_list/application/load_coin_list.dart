import 'package:cointracker/features/coin_list/domain/coin.dart';
import 'package:cointracker/features/coin_list/infrastructure/coin_list_remote_data_source.dart';

class LoadCoinListUseCase {
  final CoinListRemoteDataSource _coinListRemoteDataSource =
      _getCoinListRemoteDataSource();

  Future<List<Coin>> call() async {
    List<Coin> _coinList = await _coinListRemoteDataSource.getCoinList();
    return _coinList;
  }
}

CoinListRemoteDataSource _getCoinListRemoteDataSource() {
  CoinListRemoteDataSource _coinListRemoteDataSource =
      CoinListRemoteDataSource();

  return _coinListRemoteDataSource;
}
