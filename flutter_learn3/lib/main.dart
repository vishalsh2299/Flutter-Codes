import 'package:flutter/material.dart';
import 'package:flutter_learn3/screens/first_screen/index.dart';
import 'package:flutter_learn3/screens/second_screen/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter learn',
      home: FirstScreen(),
      routes: <String, WidgetBuilder>{
        //  route / is by default added to the home i.e. firstSceen in our case
        '/second': (BuildContext context) => SecondScreen(),
      },
    );
  }
}
