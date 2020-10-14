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
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(56, 150, 150, 1),
                    fontWeight: FontWeight.w500),
              ),
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
                          text: 'Tap "Agree and continue" to accept the ',
                          style: TextStyle(
                              height: 2,
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "WhatsApp Terms of Service and Privacy Policy",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => launch(
                                "https://pub.dev/packages/url_launcher/install"),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Color.fromRGBO(76, 175, 80, 1),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RegistrationScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
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
