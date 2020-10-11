import 'package:flutter/material.dart';
import 'package:lifecycle_stateful/lifecycleDemo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeScreen());
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stateful Widget Lifecycle Demo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return LifeCycleDemo();
                }));
              },
              child: Text("Go to next"),
            )
          ],
        ),
      ),
    );
  }
}
