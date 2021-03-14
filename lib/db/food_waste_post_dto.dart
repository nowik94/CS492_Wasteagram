import 'package:cloud_firestore/cloud_firestore.dart';

// data transfer object
class FoodWastePostDTO {
  int quantity;
  GeoPoint location;
  Timestamp date;
  String imageUrl;
}

