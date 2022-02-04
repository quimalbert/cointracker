import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMultiProvider extends StatelessWidget {
  final Widget child;

  MyMultiProvider({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: child,
      providers: [
        /*
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => getAuthenticationProvider(),
        ),*/
      ],
    );
  }
}
