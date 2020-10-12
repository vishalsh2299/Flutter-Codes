import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsappClone/screens/registration_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to WhatsApp Clone",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(76, 175, 80, 1),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              height: 290,
              width: 290,
              child: Image.asset("assets/brand.png"),
            ),
            Column(
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Read our Privacy Policy Tap, 'Agree and continue' to accept the ",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: "Terms of Service",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => launch(
                                "https://pub.dev/packages/url_launcher/install"),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Color.fromRGBO(76, 175, 80, 1),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RegistrationScreen()));
                  },
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
