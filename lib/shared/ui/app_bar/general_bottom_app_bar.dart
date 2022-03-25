import 'package:cointracker/features/coin_list/ui/coin_list_page.dart';
import 'package:cointracker/features/home/ui/home_page.dart';
import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/features/profile/ui/profile_page.dart';
import 'package:cointracker/shared/ui/app_bar/widgets/menu_icon.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class GeneralBottomAppBar extends StatelessWidget {
  const GeneralBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MenuIcon(
            iconData: Icons.home,
            tooltip: 'Home',
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != HomePage.routeID)
                Navigator.pushReplacementNamed(context, HomePage.routeID);
            },
          ),
          MenuIcon(
              iconData: Icons.bar_chart,
              tooltip: 'Coin List',
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name !=
                    CoinListPage.routeID)
                  Navigator.pushReplacementNamed(context, CoinListPage.routeID);
              }),
          MenuIcon(
              iconData: Icons.pie_chart_sharp,
              tooltip: 'Portfolio',
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name !=
                    PortfolioPage.routeID) {
                  Navigator.pushReplacementNamed(
                      context, PortfolioPage.routeID);
                }
              }),
          MenuIcon(
            iconData: Icons.person,
            tooltip: 'Profile',
            onPressed: () {
              if (ModalRoute.of(context)!.settings.name != ProfilePage.routeID)
                Navigator.pushReplacementNamed(context, ProfilePage.routeID);
            },
          ),
        ],
      ),
    );
  }
}
