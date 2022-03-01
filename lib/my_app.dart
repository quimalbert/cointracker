import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/features/coin_list/ui/coin_list_page.dart';
import 'package:cointracker/features/home/ui/home_page.dart';
import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/features/profile/ui/profile_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeID,
      routes: {
        LoginPage.routeID: (context) => const LoginPage(),
        HomePage.routeID: (context) => HomePage(),
        CoinListPage.routeID: (context) => const CoinListPage(),
        PortfolioPage.routeID: (context) => const PortfolioPage(),
        ProfilePage.routeID: (context) => const ProfilePage(),
        CoinDetailPage.routeID: (context) => const CoinDetailPage(),
      },
    );
  }
}
