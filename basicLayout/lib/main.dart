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
        title: Text('Basic Layout'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("Settings");
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search");
              }),
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print("Menu");
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500.0,
              height: 300.0,
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1200px-RedDot_Burger.jpg",
                  fit: BoxFit.cover),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "Chesse Burger",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  )),
                  IconButton(
                    iconSize: 60.0,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                  ),
                  Text("call")
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.directions,
                      color: Colors.blue,
                    ),
                  ),
                  Text("route")
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                  ),
                  Text("share")
                ])
              ],
            )),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              child: Expanded(
                  child: Text(
                "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.",
                softWrap: true,
                style: TextStyle(fontSize: 15.0),
              )),
            )
          ],
        ),
      ),
    );
  }
}
