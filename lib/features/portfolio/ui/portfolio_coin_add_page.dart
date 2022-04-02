import 'package:cointracker/features/portfolio/ui/portfolio_coin_add_content.dart';
import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

class PortfolioCoinAddPage extends StatelessWidget {
  static const String routeID = '/portfolio_coin_add';

  const PortfolioCoinAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Coin> _arguments =
        ModalRoute.of(context)!.settings.arguments as List<Coin>;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            PortfolioPage.routeID, (Route<dynamic> route) => false);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PortfolioCoinAddContent(coinList: _arguments),
          appBar: const GeneralTopAppBar(
            showBackButton: true,
            pushRoute: PortfolioPage.routeID,
          ),
        ),
      ),
    );
  }
}
