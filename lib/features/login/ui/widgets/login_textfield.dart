import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final bool isPassword;
  const LoginTextField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onChanged: (String value) => onChanged(value),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
