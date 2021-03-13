import 'package:flutter/material.dart';
import 'package:wasteagram/screens/list_screen.dart';

class App extends StatelessWidget {

  static final routes = {
    ListScreen.routeName: (context) => ListScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(brightness: Brightness.dark),
      routes: routes,
    );
  }
}
