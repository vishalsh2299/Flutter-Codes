import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sideBar_Navigation/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sideBar_Navigation/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>(); // rxdart for this
    isSideBarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus =
        _animationController.status; // get current status of animation

    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0, // make sure it takes full screen
          left: isSideBarOpenedAsync.data
              ? 0
              : -screenWidth, // if we will not give -ve size on close it will reduce the width of the row. we need to preserve that
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          // width is 35 so -45 will give that blue line on the side
          child: Row(
            children: [
              Expanded(
                  // the blue part bar
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xFF262AAA),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    ListTile(
                      title: Text(
                        "Vishal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "vishalsh2299@gmail.com",
                        style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Color(0xFF1BB5FD),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.home,
                      title: "Home",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(
                            NavigationEvents
                                .HomePageClickedEvents); // event is dispatched
                      },
                    ),
                    MenuItem(
                      icon: Icons.person,
                      title: "My Account",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(
                            NavigationEvents
                                .MyAccountClickedEvent); // event is dispatched
                      },
                    ),
                    MenuItem(
                      icon: Icons.shopping_basket,
                      title: "My Orders",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(
                            NavigationEvents
                                .MyOrdersClickedEvent); // event is dispatched
                      },
                    ),
                    MenuItem(
                      icon: Icons.card_giftcard,
                      title: "Whishlist",
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Color(0xFF1BB5FD),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Logout",
                    )
                  ],
                ),
              )),
              Align(
                alignment: Alignment(0, -0.9), // position it at the top
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      // the hamburger icon or pop out of sidebar
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController.view,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  // for the hamburger part curved shaped
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors
        .white; // the curved close path is set to white rest is blue, consider it as rectangle and path is the white one, blue is the remaining

    final width = size.width; // 35 passed from the ClipPath
    final height = size.height; //110

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
