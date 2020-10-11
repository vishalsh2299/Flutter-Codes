import 'package:flutter/material.dart';
import 'package:sideBar_Navigation/bloc.navigation_bloc/navigation_bloc.dart';

class MyOrdersPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Orders",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
