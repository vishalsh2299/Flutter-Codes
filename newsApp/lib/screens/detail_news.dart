import 'package:flutter/material.dart';

class DetailNews extends StatelessWidget {
  final String author;
  final String date;
  final String title;
  final String description;
  final String content;
  final String urlToImage;

  const DetailNews(
      {Key key,
      this.author,
      this.date,
      this.title,
      this.description,
      this.content,
      this.urlToImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          Image.network(
            urlToImage,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0, 0),
                        child: IconButton(
                            alignment: Alignment.topLeft,
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 40.0, 15.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(title,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("by $author"),
                                SizedBox(height: 8),
                                Text(date,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 30),
                                Text("Description:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(description,
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                SizedBox(height: 30),
                                Text("Content:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(content,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
