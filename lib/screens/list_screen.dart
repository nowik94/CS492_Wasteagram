import 'package:flutter/material.dart';

// screen that will display all food waste posts by date

class ListScreen extends StatelessWidget {
  // route
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram')),
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
