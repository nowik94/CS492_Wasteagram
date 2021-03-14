import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/screens/details_screen.dart';
import 'package:wasteagram/widgets/camera_fab.dart';

// screen that will display all food waste posts by date

class ListScreen extends StatelessWidget {
  // route
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Wasteagram')),
      body: StreamBuilder(
          // get data from firestore -> order by most recent date
          stream: FirebaseFirestore.instance
              .collection('food_waste_posts')
              .orderBy('date', descending: true)
              .snapshots(),
          builder:
              (BuildContext content, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData &&
                snapshot.data.docs != null &&
                snapshot.data.docs.length > 0) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data.docs[index];
                    FoodWastePost newWastePost = FoodWastePost(
                        date: post['date'],
                        quantity: post['quantity'],
                        location: post['location']);
                    return ListTile(
                      trailing: Text(newWastePost.quantity.toString()),
                      title: Text(newWastePost.formatDate()),
                      // on tap function that will go to details screen
                      onTap: () {
                        goToFoodWasteDetails(context, newWastePost);
                      },
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: CameraFab(), // custom FAB for camera
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // function that will navigate to the selected details screen for the post
  void goToFoodWasteDetails(BuildContext context, FoodWastePost foodWastePost) {
    Navigator.pushNamed(context, DetailsScreen.routeName, arguments: {
      foodWastePost
    });
  }
}
