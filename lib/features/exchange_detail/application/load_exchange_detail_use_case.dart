import 'package:cointracker/features/exchange_detail/domain/load_exchange_detail_data_source.dart';

class LoadExchangeDetailUseCase {
  Future<List<dynamic>> call() async {
    List<dynamic> _exchangeDetail =
        await LoadExchangeDetailDataSource().getExchangeDetail();
    return _exchangeDetail;
  }
}
