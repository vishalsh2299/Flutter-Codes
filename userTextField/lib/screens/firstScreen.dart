import 'package:flutter/material.dart';
import 'package:userTextField/main.dart';

class FirstScreen extends StatelessWidget {
  final firstName;
  final lastName;
  FirstScreen({this.firstName, this.lastName});
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: themeData.copyWith(
            primaryColor: Colors.deepPurpleAccent,
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent,
                textTheme: ButtonTextTheme
                    .primary)), // changing themeData in parent(main.dart)

        child: Scaffold(
          appBar: AppBar(
            title: Text("Data"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 300.0,
                    height: 100.0,
                    decoration: BoxDecoration(border: Border.all(width: 1.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          firstName,
                          style: TextStyle(fontSize: 25.0),
                        ),
                        RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.normal),
                            ))
                      ],
                    )),
                Theme(
                    data: themeData.copyWith(),
                    child: Container(
                        width: 300.0,
                        height: 100.0,
                        decoration:
                            BoxDecoration(border: Border.all(width: 1.0)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lastName,
                                style: TextStyle(fontSize: 25.0),
                              ),
                              RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.normal),
                                  ))
                            ],
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}
