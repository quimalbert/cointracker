import 'package:flutter/material.dart';

void scaffoldSnackBar({
  required BuildContext context,
  required String text,
  required bool isError,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: isError ? Colors.redAccent : Colors.green,
    ),
  );
}
