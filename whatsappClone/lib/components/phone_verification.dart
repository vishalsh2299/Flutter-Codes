import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsappClone/components/initial_profile_page.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController _pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Two Step Verification",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(56, 150, 150, 1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'This account is protected by two step verification. Enter your passcode to complete registration. ',
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "Resend OTP? ",
                      recognizer: new TapGestureRecognizer()..onTap = () => {},
                      style: TextStyle(
                          fontSize: 15,
                          height: 1.3,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            _pinCodeWidget(),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 200, 80, 1),
                        onPressed: () {
                          if (_pinCodeController.text.length == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => InitialProfilePage()));
                          } else {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Enter 6 digit OTP')));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          PinCodeTextField(
            controller: _pinCodeController,
            obscureText: true,
            backgroundColor: Colors.transparent,
            length: 6,
            keyboardType: TextInputType.phone,
            onChanged: (pincode) {
              print(pincode);
            },
            appContext: context,
          ),
          Text(
            "Enter your 6 digit code",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
