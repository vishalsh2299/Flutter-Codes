import 'dart:async';

import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/DataLayer/restaurant.dart';
import 'package:zomatoRestrauntFinder/DataLayer/zomato_client.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc.dart';

class RestaurantBloc implements Bloc {
  // same as location_query_bloc just the difference is it fetches restaurants instead of locations
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;

  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
