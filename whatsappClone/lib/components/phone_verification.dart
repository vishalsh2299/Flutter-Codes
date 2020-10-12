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
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(76, 175, 80, 1),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "WhatsApp Clone will send SMS to your phone number. Enter your country code and phone number: "),
            _pinCodeWidget(),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 175, 80, 1),
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
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
      child: Column(
        children: [
          PinCodeTextField(
            controller: _pinCodeController,
            obscureText: true,
            backgroundColor: Colors.transparent,
            length: 6,
            onChanged: (pincode) {
              print(pincode);
            },
            appContext: context,
          ),
          Text("Enter your 6 digit code")
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
