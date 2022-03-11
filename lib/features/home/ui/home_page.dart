import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';

import 'home_content.dart';

class HomePage extends StatelessWidget {
  static const String routeID = '/home';

  //const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomeContent(),
        appBar: GeneralTopAppBar(),
        bottomNavigationBar: GeneralBottomAppBar(),
      ),
    );
  }
}
