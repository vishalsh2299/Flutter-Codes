import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:heroAnimationFlutter/firstScreen.dart';
import 'package:heroAnimationFlutter/photoHero.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: Center(
        child: PhotoHero(
            photo: './assets/avatar.jpg',
            width: 180.0,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FirstScreen()));
            }),
      ),
    );
  }
}
