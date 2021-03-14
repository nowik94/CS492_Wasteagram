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

  // member function that will format the date
  String formatDate() {
    return DateFormat.yMMMEd().format(date.toDate());
  }
}
