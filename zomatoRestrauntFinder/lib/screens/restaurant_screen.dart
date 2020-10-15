import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc_provider.dart';
import 'package:zomatoRestrauntFinder/bloc/restaurant_bloc.dart';
import 'package:zomatoRestrauntFinder/screens/favorite_screen.dart';
import 'package:zomatoRestrauntFinder/screens/location_screen.dart';
import 'package:zomatoRestrauntFinder/utils/restaurant_tile.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;

  const RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => FavoriteScreen())))
        ],
      ),
      body: _buildSearch(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_location),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LocationScreen(
                  isFullScreenDialog: true,
                ),
            fullscreenDialog: true)),
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(location);

    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What do you want to eat?'),
              onChanged: (query) =>
                  bloc.submitQuery(query), // user query passed to bloc
            ),
          ),
          Expanded(child: _buildStreamBuilder(bloc))
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          if (results == null) {
            return Center(
              child: Text("Enter a restaurant name or cuisin type"),
            );
          }

          if (results.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final restaurant = results[index];
          return RestaurantTile(restaurant: restaurant);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: results.length);
  }
}
