import 'dart:async';

import 'package:zomatoRestrauntFinder/DataLayer/restaurant.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc.dart';

class FavoriteBloc implements Bloc {
  var _restaurants = <Restaurant>[];

  List<Restaurant> get favorites => _restaurants;

  // this one is brodcast stream controller. This allows multiple streams
  // regular streams only allow one. in previous two we had one to one relation
  // here the stream needs to be listened at two places

  final _controller = StreamController<List<Restaurant>>.broadcast();

  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  // this just adds the restaurant if its not in the list and if it is then remove
  void toggleRestaurant(Restaurant restaurant) {
    if (_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }

    _controller.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
