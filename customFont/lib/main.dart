import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Styles"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Batman",
              style: TextStyle(fontFamily: 'Charmonman', fontSize: 25.0),
            ),
            Text(
              "Superman",
              style: TextStyle(fontFamily: 'DancingScript', fontSize: 25.0),
            ),
            Text(
              "Catwoman",
              style: TextStyle(
                  fontFamily: 'KumbhSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
