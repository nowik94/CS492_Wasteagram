// model class for one Food Waste Post

class FoodWastePost {
  final DateTime date;
  final double latitude;
  final double longitude;
  final int quantity;
  final String imageUrl;

  FoodWastePost({this.date, this.latitude, this.longitude, this.quantity, this.imageUrl});
}