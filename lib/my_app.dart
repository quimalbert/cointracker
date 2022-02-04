import 'package:cointracker/features/login/ui/login_page.dart';
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
      },
    );
  }
}
