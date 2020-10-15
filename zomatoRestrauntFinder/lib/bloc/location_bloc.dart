import 'dart:async';

import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc.dart';

class LocationBloc implements Bloc {
  Location _location;

  Location get selectedLocation => _location;

  // private stream controller declared it will manage sink and streams for this bloc
  // it uses generics to tell what kind of event it will emit (here Location)
  final _locationController = StreamController<Location>();

  // it exposes a public getter to the stream controller's stream
  Stream<Location> get locationStream => _locationController.stream;

  // Input for the Bloc. First location model is cached in _location private property and then added to sink for stream.
  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    // closing stream controller to prevent memory leaks.
    _locationController.close();
  }
}
