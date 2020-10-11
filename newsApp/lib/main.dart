import 'package:flutter/material.dart';
import 'package:newsApp/screens/my_news.dart';

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
