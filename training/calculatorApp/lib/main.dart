import 'package:calculatorApp/screens/my_news.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS APP',
      home: MyNews(),
    );
  }
}
