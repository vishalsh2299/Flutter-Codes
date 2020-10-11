import 'package:flutter/material.dart';
import 'package:userInterface/screens/firstScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Color(0xff393e46),
        primaryColorDark: Color(0xff222831),
        accentColor: Color(0xff00adb5),
        backgroundColor: Color(0xffeeeeee),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xff222831)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext contex) => FirstScreen())),
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
