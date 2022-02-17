import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

import 'coin_detail_content.dart';

class CoinDetailPage extends StatelessWidget {
  static const String routeID = '/coindetail';

  //const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: CoinDetailContent(),
        appBar: GeneralTopAppBar(),
        bottomNavigationBar: GeneralBottomAppBar(),
      ),
    );
  }
}
