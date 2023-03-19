import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/forms/login_page.dart';
import 'package:mobile/forms/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
          child: Column(
            children: [
              // Expanded(
              //     child: Container(
              //         decoration: BoxDecoration(
              //   image: AssetImage(),
              // ))),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "U-Shield",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text("For Your Campus Safety and Navigation",
                            style: GoogleFonts.openSans(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w400))
                      ]),
                ),
              ),

              // Asset(),
              Expanded(flex: 4, child: Text("Wasssususus")),

              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: Color.fromRGBO(31, 84, 211, 1)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 17,
                            ),
                            Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Get Started',
                                      style: GoogleFonts.openSans(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ]),
                    ),

                    // This was the manual one
                    // TextButton(
                    //   onPressed: (() {}),
                    //   child: Row(
                    //       // crossAxisAlignment: CrossAxisAlignment.center,
                    //       // mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SizedBox(
                    //           width: 130,
                    //         ),
                    //         Text(
                    //           "Get Started",
                    //           textAlign: TextAlign.center,
                    //           style: GoogleFonts.openSans(
                    //               fontSize: 17,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w600),
                    //         ),
                    //         Spacer(),
                    //         Icon(
                    //           Icons.arrow_forward,
                    //           color: Colors.white,
                    //         )
                    //       ]),
                    //   style: TextButton.styleFrom(
                    //       // backgroundColor: Color.fromRGBO(31, 84, 211, 1),
                    //       backgroundColor: Color.fromRGBO(39, 38, 221, 1),
                    //       minimumSize: const Size.fromHeight(50)),
                    // ),

                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      }),
                      child: Text(
                        "I already have an account",
                        style: GoogleFonts.openSans(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(226, 232, 240, 1),
                          minimumSize: const Size.fromHeight(50)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
