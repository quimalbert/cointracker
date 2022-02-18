import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

import 'portfolio_content.dart';

class PortfolioPage extends StatelessWidget {
  static const String routeID = '/portfolio';

  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: PortfolioContent(),
        appBar: GeneralTopAppBar(),
        bottomNavigationBar: GeneralBottomAppBar(),
      ),
    );
  }
}
