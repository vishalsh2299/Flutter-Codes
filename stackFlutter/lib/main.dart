import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Flutter"),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 250.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage("./assets/avatar.jpg"), fit: BoxFit.cover),
              border: Border.all(width: 2.0)),
          child: Stack(
            children: [
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Text(
                  "Black Panther",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                child: Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 25.0,
                ),
                right: 0.0,
                bottom: 0.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
