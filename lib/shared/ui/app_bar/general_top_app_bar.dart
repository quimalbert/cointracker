import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class GeneralTopAppBar extends StatelessWidget with PreferredSizeWidget {
  const GeneralTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      flexibleSpace: Image.asset(
        'assets/images/logo.png',
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DEVICE_SCREEN_HEIGHT * 0.1);
}
