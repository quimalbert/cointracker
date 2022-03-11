import 'package:cointracker/features/coin_list/infrastructure/coin_list_remote_data_source.dart';
import 'package:cointracker/shared/domain/coin.dart';

class LoadCoinListUseCase {
  Future<List<Coin>> call() async {
    List<Coin> _coinList = await CoinListRemoteDataSource().getCoinList();
    return _coinList;
  }
}
