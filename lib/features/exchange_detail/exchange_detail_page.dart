import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/domain/exchange.dart';
import 'exchange_detail_content.dart';

class ExchangeDetailPage extends StatelessWidget {
  static const String routeID = '/exchange_detail';

  const ExchangeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Exchange _exchange =
        ModalRoute.of(context)!.settings.arguments as Exchange;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ExchangeDetailContent(
          exchange: _exchange,
        ),
        appBar: GeneralTopAppBar(),
        bottomNavigationBar: GeneralBottomAppBar(),
      ),
    );
  }
}
