import 'package:flutter/material.dart';


// screen that will show the details of a specific food waste post

class DetailsScreen extends StatelessWidget {
  // route name
  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram')),
      body: SafeArea(),
    );
  }
}
