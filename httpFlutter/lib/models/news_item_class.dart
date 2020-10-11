class NewsItem {
  final String author;
  final String url;
  final String title;
  final String body;
  final int score;

  NewsItem({this.author, this.url, this.title, this.body, this.score});

  // decode json object for each news item
  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
        author: json['by'],
        url: json['url'],
        title: json['title'],
        body: json['body'],
        score: json['score']);
  } // json[key] // in the api
}
