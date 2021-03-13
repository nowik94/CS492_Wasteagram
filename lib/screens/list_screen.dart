import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('food_waste_posts').snapshots(),
        builder: (BuildContext content, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData && snapshot.data.docs != null && snapshot.data.docs.length > 0){
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                var post = snapshot.data.docs[index];
                return ListTile(
                  leading: Text(post['quantity'].toString()),
                  title: Text('Post Title')
                );
              }
            );
        } else {
          return Center(
            child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}
