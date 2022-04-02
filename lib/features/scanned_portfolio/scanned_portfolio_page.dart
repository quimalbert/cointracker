import 'package:cointracker/features/scanned_portfolio/scanned_portfolio_content.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

import '../portfolio/ui/portfolio_page.dart';

class ScannedPortfolioPage extends StatelessWidget {
  static const String routeID = '/scanned_portfolio';

  const ScannedPortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _arguments = ModalRoute.of(context)!.settings.arguments as List;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            PortfolioPage.routeID, (Route<dynamic> route) => false);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ScannedPortfolioContent(
              email: _arguments[0], portfolioMap: _arguments[1]),
          appBar: const GeneralTopAppBar(
            showBackButton: true,
            pushRoute: PortfolioPage.routeID,
          ),
        ),
      ),
    );
  }
}
