import 'package:flutter/material.dart';
import 'package:newsApp/screens/detail_news.dart';

class SlideCardView extends StatelessWidget {
  final String author;
  final String date;
  final String title;
  final String description;
  final String content;
  final String urlToImage;

  const SlideCardView(
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DetailNews(
                      author: author,
                      date: date,
                      title: title,
                      description: description,
                      content: content,
                      urlToImage: urlToImage,
                    )));
      },
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, top: 20.0, bottom: 10.0),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network(
                urlToImage,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("by $author",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(date, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 15),
                    ConstrainedBox(
                        constraints: new BoxConstraints(maxHeight: 30.0),
                        child: new Text(
                          description,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailNews(
                                            author: author,
                                            date: date,
                                            title: title,
                                            description: description,
                                            content: content,
                                            urlToImage: urlToImage,
                                          )));
                            },
                            child: Text("Read more..."))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
