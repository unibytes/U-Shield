import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/button.dart';
import '../components/inputbox.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(children: [
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
            SizedBox(
              height: 20,
            ),
            InputBox(
              hintText: "Enter first name",
              controller: _userController,
            ),
            SizedBox(
              height: 15,
            ),
            InputBox(
              hintText: "Enter last name",
              controller: _userController,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CSCPicker(
                    dropdownDecoration: BoxDecoration(
                      color: Color.fromRGBO(233, 236, 239, 0.7),
                    ),
                    countryDropdownLabel: "Country",
                    showCities: false,
                    showStates: false,
                  ),
                ),
                // TextButton.icon(
                //     style: TextButton.styleFrom(
                //         textStyle: TextStyle(fontSize: 17, color: Colors.black),
                //         padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                //         backgroundColor: Color.fromRGBO(233, 236, 239, 0.7)),
                //     onPressed: () {},
                //     icon: Icon(Icons.flag_outlined),
                //     label: Text(
                //       "+1",
                //       style: GoogleFonts.openSans(color: Colors.black),
                //     )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15, 16, 15, 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(31, 84, 211, 1),
                        ),
                      ),
                      hintText: "Mobile number",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(233, 236, 239, 0.7),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    autofocus: false,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              buttonContent: "Next",
              onPressed: (() {
                
              }
              ),
            )
          ])),
    );
  }
}

// 