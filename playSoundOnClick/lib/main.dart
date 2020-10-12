import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

void playNote(int i){
  AudioCache().play("note$i.wav");
}

Expanded keyMaker(Color color, int key){
  return Expanded(
    child: FlatButton(
      onPressed: ()=>playNote(key),
      color: color,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Day4 session1",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              keyMaker(Colors.red, 1),
              keyMaker(Colors.orange, 2),
              keyMaker(Colors.yellow, 3),
              keyMaker(Colors.blue, 4),
              keyMaker(Colors.green, 5),
              keyMaker(Colors.purple, 6),
              keyMaker(Colors.pink, 7),
            ],
          ),
        ),
      ),
    );
  }
}
