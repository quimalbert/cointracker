import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/features/coin_list/ui/coin_list_page.dart';
import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/features/profile/ui/profile_page.dart';
import 'package:cointracker/shared/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'context.dart';
import 'features/home/ui/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Future firebaseInitialize() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}

Future firebaseUser() async {
  final user = await FirebaseAuth.instance.currentUser?.email;
  return user;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Context.globalKey,
      home: FutureBuilder(
        future: firebaseInitialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          } else {
            return CustomCircularProgressIndicator();
          }
        },
      ),
      //initialRoute: LoginPage.routeID,
      routes: {
        //LoginPage.routeID: (context) => LoginPage(),
        HomePage.routeID: (context) => HomePage(),
        CoinListPage.routeID: (context) => const CoinListPage(),
        PortfolioPage.routeID: (context) => const PortfolioPage(),
        ProfilePage.routeID: (context) => const ProfilePage(),
        CoinDetailPage.routeID: (context) => const CoinDetailPage(),
        ExchangeDetailPage.routeID: (context) => const ExchangeDetailPage(),
      },
    );
  }
}
