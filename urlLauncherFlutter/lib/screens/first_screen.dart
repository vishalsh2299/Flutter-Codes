import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  // TO LAUNCH URL
  _lauchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  // LAUNCH TELEPHONE
  _lauchTelephone() async {
    const url = 'tel:+91 8423230932';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  // LAUNCH MAIL
  _lauchMail() async {
    const url = 'mailto:vishalsh2299@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  // LAUNCH SMS
  _lauchSMS() async {
    const url = 'sms:8423230932';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter url_launcher'),
        elevation: 0.7,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                _lauchURL();
              },
              child: Text("Browser"),
            ),
            RaisedButton(
              onPressed: () {
                _lauchTelephone();
              },
              child: Text("Telephone"),
            ),
            RaisedButton(
              onPressed: () {
                _lauchMail();
              },
              child: Text("Mail"),
            ),
            RaisedButton(
              onPressed: () {
                _lauchSMS();
              },
              child: Text("SMS"),
            )
          ],
        ),
      ),
    );
  }
}
