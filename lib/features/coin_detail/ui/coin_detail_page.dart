import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

import 'coin_detail_content.dart';

class CoinDetailPage extends StatelessWidget {
  static const String routeID = '/coin_detail';

  const CoinDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Coin _coin = ModalRoute.of(context)!.settings.arguments as Coin;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CoinDetailContent(coin: _coin),
        appBar: const GeneralTopAppBar(),
        bottomNavigationBar: const GeneralBottomAppBar(),
      ),
    );
  }
}
