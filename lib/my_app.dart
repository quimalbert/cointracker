import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/features/coin_list/ui/coin_list_page.dart';
import 'package:cointracker/features/login/ui/login_page.dart';
import 'package:cointracker/features/portfolio/ui/portfolio_page.dart';
import 'package:cointracker/features/profile/ui/profile_page.dart';
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
            return CircularProgressIndicator();
          }
        },
      ),
      //initialRoute: LoginPage.routeID,
      routes: {
        //LoginPage.routeID: (context) => LoginPage(),
        HomePage.routeID: (context) => HomePage(),
        CoinListPage.routeID: (context) => CoinListPage(),
        PortfolioPage.routeID: (context) => PortfolioPage(),
        ProfilePage.routeID: (context) => ProfilePage(),
        CoinDetailPage.routeID: (context) => CoinDetailPage(),
      },
    );
  }
}
