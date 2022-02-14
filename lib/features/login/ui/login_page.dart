import 'package:cointracker/features/login/ui/login_content.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeID = '/';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: LoginContent(),
    );
  }
}
