import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/components/inputbox.dart';

import '../components/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ink(
              //   decoration: const ShapeDecoration(
              //     color: Color.fromRGBO(226, 232, 240, 1),
              //     shape: CircleBorder(),
              //   ),
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     color: Colors.black,
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton.icon(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios,
                          color: Color.fromRGBO(31, 84, 211, 1)),
                      label: Text(
                        "Back",
                        style: TextStyle(color: Color.fromRGBO(31, 84, 211, 1)),
                      )),
                  // Text(
                  //   "Login",
                  //   textAlign: TextAlign.end,
                  //   style: GoogleFonts.openSans(
                  //     fontSize: 20,
                  //     color: Color.fromRGBO(31, 84, 211, 1),
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),

                  // Text(
                  //   "Login",
                  //   textAlign: TextAlign.end,
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w800,
                  //   ),
                  // ),

                  Text(
                    "U-Shield",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
              Divider(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                  "Hello, Welcome Back ! 👋",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 19, color: Colors.black87),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: InputBox(hintText: "johndoe@gmail.com"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: InputBox(
                        hintText: "Enter your password",
                        obscure: true,
                      ),
                    ),
                    Button(
                      buttonContent: "Continue",
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              height: 15,
                              color: Colors.black26,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "or",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.black26,
                            thickness: 1,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Button(
                            buttonContent: "Continue with Google",
                            iconName: "google",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            buttonContent: "Continue with Apple",
                            iconName: "apple",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            buttonContent: "Continue with FaceBook",
                            iconName: "facebook",
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
