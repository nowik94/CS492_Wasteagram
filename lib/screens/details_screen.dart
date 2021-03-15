import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';

// screen that will show the details of a specific food waste post

class DetailsScreen extends StatelessWidget {
  // route name
  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {
    final FoodWastePost post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
              children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            post.getFormatedDate,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            )
                        )]),
                  Image.network(
                      post.imageUrl,
                      width: MediaQuery.of(context).size.height * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Wasted Items: ${post.quantity}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          )
                      )]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // display longitude and latitude
                    children: [
                      Text('Longitude: ${post.getLongitude}'),
                      Text('Latitude: ${post.getLatitude}')
                ]),
          ]),
      ),
    ));
  }
}
