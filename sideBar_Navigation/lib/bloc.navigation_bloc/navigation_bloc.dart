import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:sideBar_Navigation/pages/homepage.dart';
import 'package:sideBar_Navigation/pages/myAccountPage.dart';
import 'package:sideBar_Navigation/pages/myOrdersPage.dart';

enum NavigationEvents {
  HomePageClickedEvents,
  MyAccountClickedEvent,
  MyOrdersClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.HomePageClickedEvents:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }
}
