import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String buttonContent;
  final String iconName;
  final Map<String, IconData> iconList = {
    "apple": Icons.apple,
    "facebook": Icons.facebook,
    "google": Icons.apple
  };

  Button({super.key, required this.buttonContent, iconName})
      : iconName = iconName ?? "";

  @override
  Widget build(BuildContext context) {
    if (iconName != "") {
      print(iconList["google"]);
      return TextButton.icon(
          style: TextButton.styleFrom(
              textStyle: GoogleFonts.openSans(fontSize: 17),
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Color.fromRGBO(233, 236, 239, 0.7)),
          onPressed: () {},
          icon: Icon(iconList[iconName]),
          label: Text(
            buttonContent,
            style: TextStyle(color: Colors.black),
          ));
    } else {
      return TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Color.fromRGBO(31, 84, 211, 1)),
        onPressed: () {},
        child: Text(buttonContent,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
      );
    }
  }
}
