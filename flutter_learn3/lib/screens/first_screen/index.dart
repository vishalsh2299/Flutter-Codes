import 'package:flutter/material.dart';
import 'package:flutter_learn3/screens/second_screen/index.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, '/second'),
            // onPressed: () => Navigator.push(
            //     // use pushReplacement if dont want the back arrow for previous page
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => SecondScreen())),
            child: Text('Click to Navigate to second page')),
      ),
    );
  }
}
