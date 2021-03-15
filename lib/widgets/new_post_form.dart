import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wasteagram/db/food_waste_post_dto.dart';

class NewPostForm extends StatefulWidget {
  // location value - this will be passed down from the parent widget -> NewPostScreen
  final Location location;
  final File receivedImage;
  NewPostForm({Key key, this.location, this.receivedImage}) : super(key: key);

  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  // global form state key
  final _formKey = GlobalKey<FormState>();
  // initialize a new DTO for our post values
  final postValues = FoodWastePostDTO();


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              wasteQuantityInputField(),
            ]
          )
        ),
      ),
    );
  }

  // Widet for input field for quantity
  Widget wasteQuantityInputField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Wasted Items',
          isDense: true,
          border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onSaved: (value) {
        postValues.quantity = int.parse(value);
      },
      validator: (value) {
        validateQuantityInput(value);
      },
    );
  }

  // valdiation function for the quantity input field
  String validateQuantityInput(value) {
    if (value.isEmpty) {
      return 'Please enter a number';
    } else if(int.parse(value) < 0) {
      return 'You must enter a non-negative number';
    }
  }

  //TODO: ADD SUBMIT -> to database
  // function that will save the data to the database
  void saveData() async {
    // timestamp
    postValues.date = Timestamp.fromDate(DateTime.now());
    // location
  }

  //TODO: Upload the file to cloudfirestore and then get the image url back..

}
