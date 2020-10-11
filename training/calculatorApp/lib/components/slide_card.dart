import 'package:calculatorApp/components/slide_card_view.dart';
import 'package:calculatorApp/services/news_provider.dart';
import 'package:flutter/material.dart';

class SlideCard extends StatefulWidget {
  @override
  _SlideCardState createState() => _SlideCardState();
}

class _SlideCardState extends State<SlideCard> {
  var stories = List<dynamic>();

  getNewsList() async {
    final newsList = await getHotNews();
    // print(newsList);

    setState(() {
      this.stories.addAll(newsList);
    });
  }

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);

    getNewsList();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.65,
      child: PageView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: List.generate(
            stories.length,
            (index) => SlideCardView(
                  author: stories[index]['author'],
                  date: stories[index]['publishedAt'],
                  title: stories[index]["title"],
                  description: stories[index]["description"],
                  content: stories[index]["content"],
                  urlToImage: stories[index]['urlToImage'],
                )),
      ),
    );
  }
}
