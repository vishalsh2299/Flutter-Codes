import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        onPressed: buttonTapped,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 20.0),
          ),
        ),
      ),
    );
    //   return GestureDetector(
    //       onTap: buttonTapped,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(20),
    //           child: Container(
    //             color: color,
    //             child: Center(
    //               child: Text(
    //                 buttonText,
    //                 style: TextStyle(color: textColor, fontSize: 20.0),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ));
    // }
  }
}
