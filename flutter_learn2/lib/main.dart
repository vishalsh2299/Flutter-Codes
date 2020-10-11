import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
//   MyHomePageState createState() {
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyApp> {
//   String statement = 'Before state Change';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("setState Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 statement,
//                 style: TextStyle(fontSize: 25.0),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                   onPressed: () {
//                     _callStateChange();
//                   },
//                   child: Text('Call setState'),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _callStateChange() {
//     setState(() {
//       statement = 'State Changed';
//     });
//   }
// }
//
//

// MAKING COUNTER APP USING STATE
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomPage(),
    );
  }
}

class MyHomPage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times: ',
            ),
            Text('$count'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
