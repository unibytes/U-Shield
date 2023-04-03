import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigAppText extends StatelessWidget {
  final String text;
  final int size;
  const BigAppText({Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.toDouble(),
          color: Colors.black),
    );
  }
}