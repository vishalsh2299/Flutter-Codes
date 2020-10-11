import 'package:flutter/material.dart';
import 'package:userTextField/screens/firstScreen.dart';

void main() {
  runApp(MyApp());
}

String firstName; // using onchange callback
String lastName; // using text edit controller
final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch:
        Colors.teal, // It is a material color better than primaryColor
    accentColor: Colors.red, // changes the floating button
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.yellow,
        textTheme: ButtonTextTheme.primary)); // global variable for theme data

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: "Text Fields",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Controller for text edit controller
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstName = ""; // default value
    lastName = "";
    myController.addListener(_printValue);
  }

  @override
  void dispose() {
    myController.removeListener(_printValue);
    myController.dispose();
    super.dispose();
  }

  _printValue() {
    setState(() {
      lastName = myController.text;
    });
    print("Last Name $lastName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext contex) =>
                    FirstScreen(firstName: firstName, lastName: lastName))),
        child: Icon(Icons.text_fields),
      ),
      appBar: AppBar(
        title: Text('Text Input'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 300.0,
              height: 250.0,
              decoration: BoxDecoration(border: Border.all(width: 1.0)),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        //border: InputBorder.none,
                        hintText: "Write Something",
                        icon: Icon(Icons.text_fields)),
                    onChanged: (text) {
                      setState(() {
                        firstName = text;
                      });
                      print("First text $firstName");
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        // border: InputBorder.none,
                        hintText: "Write Something",
                        icon: Icon(Icons.text_fields)),
                    controller: myController,
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$firstName "), Text("$lastName")],
          )
        ],
      )),
    );
  }
}
