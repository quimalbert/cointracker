import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/infrastructure/data_sources/coin_list_remote_data_source.dart';

class LoadCoinListUseCase {
  Future<List<Coin>> call() async {
    List<Coin> _coinList = await CoinListRemoteDataSource().getCoinList();
    return _coinList;
  }
}
