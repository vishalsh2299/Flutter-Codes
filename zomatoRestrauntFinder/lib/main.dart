import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc_provider.dart';
import 'package:zomatoRestrauntFinder/bloc/favorite_bloc.dart';
import 'package:zomatoRestrauntFinder/bloc/location_bloc.dart';
import 'package:zomatoRestrauntFinder/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider for location
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      // bloc provider for favorites, it needs to be accessible from multiple screens
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'Zomato App',
          theme: ThemeData(primarySwatch: Colors.red),
          home: MainScreen(),
        ),
      ),
    );
  }
}
