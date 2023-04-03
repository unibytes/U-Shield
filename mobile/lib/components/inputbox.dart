import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class InputBox extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController controller;

  const InputBox({
    Key? key,
    required this.hintText,
    this.obscure = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 19),
      obscureText: obscure,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Color.fromRGBO(31, 84, 211, 1))),
          contentPadding: EdgeInsets.all(15),
          filled: true,
          fillColor: Color.fromRGBO(233, 236, 239, 0.7),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          )),
    );
  }
}
