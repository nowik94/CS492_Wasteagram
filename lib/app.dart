import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(title: Text('Wasteagram')),
      )
    );
  }
}
