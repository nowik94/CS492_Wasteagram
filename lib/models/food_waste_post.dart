// model class for one Food Waste Post

import 'package:cloud_firestore/cloud_firestore.dart';

class FoodWastePost {
  final Timestamp date;
  final GeoPoint location;
  final int quantity;
  final String imageUrl;

  FoodWastePost({this.date, this.location, this.quantity, this.imageUrl});


}