import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/DataLayer/location.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc_provider.dart';
import 'package:zomatoRestrauntFinder/bloc/location_bloc.dart';
import 'package:zomatoRestrauntFinder/bloc/location_query_bloc.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const LocationScreen({Key key, this.isFullScreenDialog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc(); // instantination

    // bloc stored in BlocProvider which will maintain the its lifecycle
    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Where do you want to eat?"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a location'),

                // this will call Zomato and then emit the found locations to the stream
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            Expanded(
                child: _buildResults(bloc)) // pass the bloc data to this method
          ],
        ),
      ),
    );
  }

  // Add stream builder and show results in a list
  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
        stream: bloc.locationStream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          // empty list
          if (results == null) {
            return Center(
              child: Text("Enter a location"),
            );
          }

          // couldn't find what user is looking for
          if (results.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }

          // found data now show results
          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<Location> results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final location = results[index];
          return ListTile(
            title: Text(location.title),
            onTap: () {
              final locationBloc = BlocProvider.of<LocationBloc>(
                  context); // retrieves location bloc
              locationBloc.selectLocation(location);

              if (isFullScreenDialog) {
                Navigator.of(context).pop();
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: results.length);
  }
}
