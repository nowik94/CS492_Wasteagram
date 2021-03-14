import 'package:flutter/material.dart';
import 'package:wasteagram/screens/details_screen.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
class App extends StatelessWidget {

  static final routes = {
    ListScreen.routeName: (context) => ListScreen(),
    NewPostScreen.routeName: (context) => NewPostScreen(),
    DetailsScreen.routeName: (context) => DetailsScreen()
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
