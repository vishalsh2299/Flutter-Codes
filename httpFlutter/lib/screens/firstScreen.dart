import 'package:flutter/material.dart';
import 'package:httpFlutter/models/news_item_class.dart';
import 'package:httpFlutter/services/news_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var stories = List<NewsItem>();
  void initState() {
    super.initState();
    getNewsList();
  }

  getNewsList() async {
    // await getHotNewsIds();
    // await getNewsItem(24661299);
    final newsList = await getHotNewsIds().then((ids) => ids.take(15).map(
        (id) async =>
            await getNewsItem(id))); // take to get first 15 items only
    print(newsList);

    List<NewsItem> newsitems = await Future.wait(
        newsList); // wait for the Future object to get completed
    setState(() {
      this.stories.addAll(newsitems);
    });
  }

  browser(String url) async {
    await launchURL(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterLearn HackerNews"),
        elevation: 0.7,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = stories[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.author),
            onTap: () {
              browser(item.url);
            },
          );
        },
        itemCount: stories.length,
      ),
    );
  }
}
