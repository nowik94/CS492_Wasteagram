// model class for one Food Waste Post
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodWastePost {
  final Timestamp date;
  final GeoPoint location;
  final int quantity;
  final String imageUrl;

  FoodWastePost({this.date, this.location, this.quantity, this.imageUrl});

  // getter methods for longitude and latitudes
  double get getLatitude => location.latitude;
  double get getLongitude => location.longitude;
  // getter method that gets the formated date
  String get getFormatedDate => DateFormat.yMMMEd().format(date.toDate());
}
