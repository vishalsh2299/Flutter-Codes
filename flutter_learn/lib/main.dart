import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ADDING IMAGE FROM ASSETS
var assetsImage = AssetImage('assets/bg-image.jpg');
var image = Image(
  image: assetsImage,
  fit: BoxFit.cover,
);

// DYNAMIC LIST VIEW USING LIST VIEW BUILDER
List<String> content = [
  "one",
  "two",
  "three",
  "four",
  "five",
  "one",
  "two",
  "three",
  "four",
  "one",
  "two",
  "three",
  "four",
  "one",
  "two",
  "three",
  "four",
  "one",
  "two",
  "three",
  "four"
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          print("Floating action button");
        },
        child: Icon(Icons.add),
      ),

      // App Bar
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
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

      // ROW AND COLUMN
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.mail_outline, size: 60.0),
          Text(
            "Mail",
            style: TextStyle(fontSize: 25.0),
          ),
          Icon(
            Icons.search,
            size: 60.0,
          ),
          Text("Search", style: TextStyle(fontSize: 25.0)),
        ],
      ),

      // INKWELL
      // body: Center(
      //     child: InkWell(
      //   onTap: () {
      //     print("Hello inkwell Tapped");
      //   },
      //   child: Container(
      //     padding: EdgeInsets.all(25.0),
      //     child: Text(
      //       "Flat button",
      //       style: TextStyle(fontSize: 25.0),
      //     ),
      //   ),
      // )),
    );

    // LIST VIEW
    //   body: ListView(
    //     children: <Widget>[
    //       ListTile(
    //         leading: Icon(Icons.map),
    //         title: Text("Map"),
    //         onTap: () {
    //           print("Map");
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.search),
    //         title: Text("Search"),
    //         onTap: () {
    //           print("Search");
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.album),
    //         title: Text("Album"),
    //         onTap: () {
    //           print("Album");
    //         },
    //       )
    //     ],
    //   ),
    // );

    // LIST VIEW BUILDER, DYNAMIC
    // body: ListView.builder(
    //     itemCount: content.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ListTile(
    //         title: Text(content[index]),
    //       );
    //     }));

    // CENTER AND CONTAINER WIDGET
    // body: Center(
    //   child: Container(
    //     width: 300.0,
    //     height: 250.0,

    //     // Contraints to restrict expand from one side
    //     // constraints: BoxConstraints.expand(width: 300.0),
    //     decoration: BoxDecoration(
    //       // borderRadius: BorderRadius.circular(15.0),
    //       color: Colors.lightBlue,
    //       border: Border.all(
    //         width: 2.0,
    //       ),

    //       // ADDING IMAGE AS BOX DECORATION
    //       // image: DecorationImage(
    //       //     image: NetworkImage(
    //       //         'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg'),
    //       //     fit: BoxFit.cover)),
    //     ),
    //     // child: Text(
    //     //   "Hello Flutter",
    //     //   style: TextStyle(
    //     //       fontSize: 25.0,
    //     //       fontWeight: FontWeight.bold,
    //     //       color: Colors.blue[50]),
    //     // ),
    //     // alignment: Alignment(0.5, 0.5)),

    //     // ADDING IMAGES FROM ASSETS
    //     // child: image,

    //     // ADDING ICON AS BUTTON
    //     child: IconButton(
    //         icon: Icon(
    //           Icons.mail_outline,
    //           size: 80.0,
    //         ),
    //         onPressed: () {
    //           print("Icon is pressed");
    //         }),

    //     // // ADDING IMAGES AS CHILD ELEMENT
    //     // child: Image.network(
    //     //   'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg',
    //     //   fit: BoxFit.cover,
    //     // ),
    //   ),

    //   // PADDING WIDGET
    //   // body: Padding(
    //   //   padding: EdgeInsets.only(top: 30.0, left: 20.0),
    //   //   // TEXT rich is used to design each word seperately
    //   //   child: Text.rich(TextSpan(children: <TextSpan>[
    //   //     TextSpan(
    //   //       text: "Hello",
    //   //       style: TextStyle(
    //   //           fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.red),
    //   //     ),
    //   //     TextSpan(
    //   //       text: " World",
    //   //       style: TextStyle(fontSize: 25.0),
    //   //     ),
    //   //     TextSpan(
    //   //       text: "!!! Total Count: 0",
    //   //       style: TextStyle(fontSize: 25.0),
    //   //     )
    //   //   ])),
    //   // ),
    // ));
  }
}
