import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int index;

  const CustomTabBar({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Color.fromRGBO(56, 140, 100, 1)),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: CustomTabBarButton(
            text: "CHATS",
            textColor: index == 1
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.grey[300],
            borderColor: index == 1
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.transparent,
          )),
          Expanded(
              child: CustomTabBarButton(
            text: "STATUS",
            textColor: index == 2
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.grey[300],
            borderColor: index == 2
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.transparent,
          )),
          Expanded(
              child: CustomTabBarButton(
            text: "CALLS",
            textColor: index == 3
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.grey[300],
            borderColor: index == 3
                ? Color.fromRGBO(255, 255, 255, 1)
                : Colors.transparent,
          ))
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton(
      {Key key,
      this.text,
      this.borderColor,
      this.textColor,
      this.borderWidth = 3.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: borderColor, width: borderWidth))),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
    );
  }
}
