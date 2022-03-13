import 'package:cointracker/features/exchange_detail/ui/exchange_detail_content.dart';
import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

class ExchangeDetailPage extends StatelessWidget {
  static const String routeID = '/exchangedetail';

  const ExchangeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ExchangeDetail(),
        appBar: GeneralTopAppBar(),
        bottomNavigationBar: GeneralBottomAppBar(),
      ),
    );
  }
}
