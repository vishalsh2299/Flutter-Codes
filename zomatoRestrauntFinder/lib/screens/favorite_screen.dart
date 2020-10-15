import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/DataLayer/restaurant.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc_provider.dart';
import 'package:zomatoRestrauntFinder/bloc/favorite_bloc.dart';
import 'package:zomatoRestrauntFinder/utils/restaurant_tile.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorties"),
      ),
      body: StreamBuilder<List<Restaurant>>(
        stream: bloc.favoritesStream,
        initialData: bloc.favorites,
        builder: (context, snapshot) {
          // if data is not added to streams than it will use the explicit favorites already added instead of new events
          List<Restaurant> favorites =
              (snapshot.connectionState == ConnectionState.waiting)
                  ? bloc.favorites
                  : snapshot.data;

          if (favorites == null || favorites.isEmpty) {
            return Center(
              child: Text('No favorites'),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) {
                final restaurant = favorites[index];
                return RestaurantTile(
                  restaurant: restaurant,
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: favorites.length);
        },
      ),
    );
  }
}
