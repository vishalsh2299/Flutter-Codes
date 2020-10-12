import 'package:flutter/material.dart';

class InitialProfilePage extends StatefulWidget {
  @override
  _InitialProfilePageState createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Text(
              "Profile Info",
              style: TextStyle(
                  color: Color.fromRGBO(76, 175, 80, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please Provide your name and optional profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _rowWidget(),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => MaterialButton(
                        color: Color.fromRGBO(76, 175, 80, 1),
                        onPressed: () {
                          if (_nameController.text.isEmpty) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Enter your name ...')));
                          } else {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Successful')));
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Icon(Icons.camera_alt),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "Enter your name"),
          )),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(Icons.insert_emoticon),
          )
        ],
      ),
    );
  }
}
