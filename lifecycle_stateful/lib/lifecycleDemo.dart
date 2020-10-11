import 'package:flutter/material.dart';

class LifeCycleDemo extends StatefulWidget {
  LifeCycleDemo() {
    print("Widget constructor");
  }

  @override
  _LifeCycleDemoState createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  int c = 0;

  _LifeCycleDemoState() {
    print("Widget State Contructor");
  }

  @override
  void initState() {
    print("From init state");
    super.initState();
  }

  @override
  void didUpdateWidget(LifeCycleDemo oldWidget) {
    print("From state didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print("From state didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("Form state dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("From state build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Widget LifeCycle Demo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Counter: $c"),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    c++;
                  });
                },
                child: Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
