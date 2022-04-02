import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class GeneralTopAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showBackButton;
  final String pushRoute;
  const GeneralTopAppBar({
    Key? key,
    this.showBackButton = false,
    this.pushRoute = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      flexibleSpace: Image.asset('assets/images/logo.png'),
      backgroundColor: backgroundColor,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    pushRoute, (Route<dynamic> route) => false);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ))
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DEVICE_SCREEN_HEIGHT * 0.1);
}
