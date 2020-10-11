import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int curr = 0;

  final String img, heading, textbody;
  _BodyState({Key key, this.img, this.heading, this.textbody});

  List<Map<String, String>> splashData = [
    {
      "img": "./assets/images/first.jpg",
      "heading": "Tone up your body",
      "textbody":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do asdv tempor  ut labore et dolore magna aliqua."
    },
    {
      "img": "./assets/images/second.jpg",
      "heading": "Meditation and Fitness",
      "textbody":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do asdv tempor  ut labore et dolore magna aliqua."
    },
    {
      "img": "./assets/images/third.jpg",
      "heading": "Increase your strength & stamina",
      "textbody":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do asdv tempor  ut labore et dolore magna aliqua."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 20.0, left: 20.0, right: 20.0, top: 30.0),
              child: PageView.builder(
                // makes it scrollable even content overflows
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                onPageChanged: (value) {
                  setState(() {
                    curr = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  img: splashData[index]['img'],
                  heading: splashData[index]['heading'],
                  textbody: splashData[index]['textbody'],
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(splashData.length,
                          (index) => buildDot(index: index))),
                )
              ],
            )),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(right: 8),
      height: curr == index ? 10 : 6,
      width: curr == index ? 10 : 6,
      decoration: BoxDecoration(
          color: curr == index ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({Key key, this.img, this.heading, this.textbody})
      : super(key: key);

  final String img, heading, textbody;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          img,
          height: 300.0,
          width: 300.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          child: Text(heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
          child: Text(
            textbody,
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
