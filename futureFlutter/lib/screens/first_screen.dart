import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class FirstScreen extends StatelessWidget {
  // USING FUTURE API
  // Future<dynamic> fetchData() {
  //   Future<http.Response> response =
  //       http.get('https://jsonplaceholder.typicode.com/posts/2');
  //   return response.then((res) {
  //     print("Response status: ${res.statusCode}");

  //     if (res.statusCode == 404) {
  //       return 'Error';
  //     } else {
  //       return res.body;
  //     }
  //   });
  // }

  // USING ASYNC AWAIT
  fetchData() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/posts/2');
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 404) {
      return 'Error';
    } else {
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    // USING FUTURE API
    // function which will call the future that we created above
    // onClickFunc() {
    //   Future<dynamic> success = Future(fetchData);
    //   success.then((data) {
    //     if (data != 'Error') {
    //       print("Received from fetchData $data");
    //     } else {
    //       print("Received from fetchData $data");
    //     }
    //   });
    // }

    // USING ASYNC AWAIT
    onClickFunc() async {
      dynamic data = await fetchData();
      print("Inside clickFunction $data");
      if (data != 'Error') {
        if (data != 'Error') {
          print("Received from fetchData $data");
        } else {
          print("Received from fetchData $data");
        }
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Page"),
      ),
      body: new Center(
        child: new FlatButton(
            // FUTURE API
            // onPressed: () {
            //   onClickFunc();
            // },

            // USING ASYNC AWAIT
            onPressed: () async {
              print("Before clickFunction");
              await onClickFunc();
              print("After clickFunction");
            },
            child: new Text(
              "Click to call future",
              style: TextStyle(fontSize: 25.0),
            )),
      ),
    );
  }
}
