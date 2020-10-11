import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sideBar_Navigation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sideBar_Navigation/pages/homepage.dart';
import 'package:sideBar_Navigation/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(HomePage()),
      child: Stack(
        // stack as it will create one widget over another. HomePage as bottom layer and SideBar as top layer
        children: [
          BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
            return navigationState as Widget;
          }),
          SideBar()
        ],
      ),
    ));
  }
}
