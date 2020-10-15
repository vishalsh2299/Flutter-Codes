import 'dart:async';

import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/DataLayer/zomato_client.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();

  final _client =
      ZomatoClient(); // object, In ZomatoClient we get data from api

  // getter for the stream
  Stream<List<Location>> get locationStream => _controller.stream;

  // fetch locations and add to input stream
  void submitQuery(String query) async {
    final results = await _client.fetchLocations(query); // from ZomatoClient()

    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
