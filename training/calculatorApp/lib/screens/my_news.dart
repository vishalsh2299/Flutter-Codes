import 'package:calculatorApp/components/slide_card.dart';
import 'package:flutter/material.dart';

class MyNews extends StatefulWidget {
  MyNews({Key key}) : super(key: key);

  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        title: Center(
            child: Text(
          "News App",
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: SlideCard(),
    );
  }
}
