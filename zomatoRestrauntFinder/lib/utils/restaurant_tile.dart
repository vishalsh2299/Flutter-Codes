import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/DataLayer/restaurant.dart';
import 'package:zomatoRestrauntFinder/screens/restaurant_detail_screen.dart';
import 'package:zomatoRestrauntFinder/utils/image_container.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTile({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(
        url: restaurant.thumbUrl,
        width: 50,
        height: 50,
      ),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RestaurantDetailsScreen(
                  restaurant: restaurant,
                )));
      },
    );
  }
}
