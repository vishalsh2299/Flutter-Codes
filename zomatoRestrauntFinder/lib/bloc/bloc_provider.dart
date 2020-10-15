// its a widget that stores data and provides it to children
// using provider we are adding the 2 blocs into our widget tree

import 'package:flutter/material.dart';
import 'package:zomatoRestrauntFinder/bloc/bloc.dart';

// its a generic class with type T. That implements the Bloc interface i.e. provider can only store Bloc Objects
// generic so that it can handle differnt blocs
class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, this.bloc, this.child}) : super(key: key);

  // of method allows widgets to retrieve the BlocProvider from a descendant in the widget tree with the current build context
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider =
        context.ancestorWidgetOfExactType(type); //context
    //.findAncestorWidgetOfExactType();
    return provider.bloc;
  }

//  to get reference of generic type
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // Widget passthrough to the widget's child. It wont render anything
  @override
  Widget build(BuildContext context) => widget.child;

// to dispose it we made it stateful
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
