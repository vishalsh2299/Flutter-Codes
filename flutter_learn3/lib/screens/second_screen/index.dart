import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('You are on second page')),
      ),
    );
  }
}
