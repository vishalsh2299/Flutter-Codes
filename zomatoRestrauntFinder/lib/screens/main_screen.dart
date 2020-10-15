import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc_provider.dart';
import 'package:zomatoRestrauntFinder/bloc/location_bloc.dart';
import 'package:zomatoRestrauntFinder/screens/location_screen.dart';
import 'package:zomatoRestrauntFinder/screens/restaurant_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stream builder will listen for the events from the stream. when a new event is reveivedm the builder closure will be
    // executed updating the widget tree
    return StreamBuilder<Location>(
        stream: BlocProvider.of<LocationBloc>(context)
            .locationStream, // retrieved LocationBloc and added its stream to stream builder
        builder: (context, snapshot) {
          final location = snapshot.data;

          if (location == null) {
            // if no data return the screen
            return LocationScreen();
          }

          return RestaurantScreen(location: location);
        });
  }
}
