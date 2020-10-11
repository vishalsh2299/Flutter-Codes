import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Dialog',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // method to call alert dialog
    void _showDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alert Dialog Title"),
              content: Text("Alert Dialog body"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"))
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: InkWell(
          onTap: () => _showDialog(),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Alert Box",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
