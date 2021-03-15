import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/db/food_waste_post_dto.dart';

class NewPostForm extends StatefulWidget {
  // location value - this will be passed down from the parent widget -> NewPostScreen
  final LocationData locationData;
  final File receivedImage;
  NewPostForm({Key key, this.locationData, this.receivedImage}) : super(key: key);

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
              SizedBox(height: 40),
              formUploadButton()
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

  // elevated button widget for our form that will be used to submit the form
  Widget formUploadButton() {
    return ElevatedButton(
        onPressed: () {
          saveData();
        },
        child: const Icon(Icons.cloud_upload));
  }

  //TODO: Upload the file to cloudfirestore and then get the image url back..
  // method that will save the values and upload to firebase
  void saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // obtain the current date time and covert it to a timestamp
      postValues.date = Timestamp.fromDate(DateTime.now());
      // get imageUrl
      postValues.imageUrl = await uploadImage(widget.receivedImage);
      // convert our location data to a geopoint
      postValues.location = GeoPoint(
          widget.locationData.latitude,
          widget.locationData.longitude);
      // upload to firebase
      uploadToFirebase(postValues);
      // go back to the list screen
      Navigator.of(context).pop();
    }
  }

  // function that uploads to firebase
  void uploadToFirebase(FoodWastePostDTO post) {
    // now we need to upload to firebase
    FirebaseFirestore.instance.collection('food_waste_posts').add({
      'quantity': post.quantity,
      'location': post.location,
      'date': post.date,
      'imageUrl': post.imageUrl
    });
  }

  // valdiation function for the quantity input field
  String validateQuantityInput(value) {
    if (value.isEmpty) {
      return 'Please enter a number';
    } else if(int.parse(value) < 0) {
      return 'You must enter a non-negative number';
    }
  }

  // method that uploads to image to cloudstore and gets the url of img location
  Future<String> uploadImage(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('${DateTime.now()}.jpeg');
    try {
      await ref.putFile(image);
    } on FirebaseException catch (e){
      print(e.code);
      print(e.message);
    }
    final String imageUrl = await ref.getDownloadURL();
    print('image url: $imageUrl');
    return imageUrl;
  }


}
