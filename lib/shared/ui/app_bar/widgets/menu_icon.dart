import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final String tooltip;

  const MenuIcon({
    Key? key,
    required this.iconData,
    required this.onPressed,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(10),
      tooltip: tooltip,
      iconSize: 50,
      color: Colors.white,
      icon: Icon(iconData),
      onPressed: () => onPressed,
    );
  }
}
