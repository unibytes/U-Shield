import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/components/inputbox.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/forms/homepage.dart';

import '../components/button.dart';
import '../components/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _login() async {
    var data = {
      'user_email': _emailController.text,
      'user_password': _passwordController.text
    };
    var res = await API2().postData(data, 'login');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => userHome()));

      print("work");
    } else {
      print(res.statusCode);
      print(res.body);
    }
  }

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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: InputBox(
                        hintText: "johndoe@gmail.com",
                        controller: _emailController,
                      ),
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
                        controller: _passwordController,
                      ),
                    ),
                    Button(
                      buttonContent: "Continue",
                      onPressed: () {
                        _login();
                      },
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
                            onPressed: () {
                              _login();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            buttonContent: "Continue with Apple",
                            iconName: "apple",
                            onPressed: () {
                              _login();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            buttonContent: "Continue with FaceBook",
                            iconName: "facebook",
                            onPressed: () {
                              _login();
                            },
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
