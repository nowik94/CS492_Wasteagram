import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';

// Testing each getter function for longitude and latitude
// Testing the getter function for the getFormatedDate getter

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  test('the latitude retreived from the getter should have the appropriate latitude value', () {
    // setup
    final newPost = FoodWastePost(
        location: GeoPoint(-55, 40));
    // exercize
    final double latitude = newPost.getLatitude;
    // verify
    expect(latitude, -55);
  });

  test('the longitude retreived from the getter should have the appropriate longitude value', () {
    // setup
    final newPost = FoodWastePost(
        location: GeoPoint(35, 40));
    // exercize
    final double longitude = newPost.getLongitude;
    // verify
    expect(longitude, 40);
  });

  test('the formated date from the getter should have the appropriately formated date value - weekday, month, date, year', () {
    // setup
    final newPost = FoodWastePost(
        date: Timestamp.fromDate(DateTime(2021,3,14)));
    // exercize
    final String date = newPost.getFormatedDate;
    // verify
    expect(date, 'Sunday, March 14, 2021');
  });

}