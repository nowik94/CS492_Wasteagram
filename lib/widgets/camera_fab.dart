import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

// FAB that will used to open the galleries and pick an image from gallery
class CameraFab extends StatefulWidget {

  @override
  _CameraFabState createState() => _CameraFabState();
}

class _CameraFabState extends State<CameraFab> {
  File image;
  final picker = ImagePicker();

  // method that will get the file image path from the gallery
  void getImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);

    // go to NewPostScreen and send the image file
    displayNewPostScreen(context, image);
  }

  // function that will go to the New Post Screen and will pass the file
  void displayNewPostScreen(BuildContext context, File args) {
    Navigator.pushNamed(context, NewPostScreen.routeName, arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      label: 'camera',
      onTapHint: 'select an image for a new post',
      child: FloatingActionButton(
          onPressed: () {
            getImage(context);
          },
          child: const Icon(Icons.add_a_photo)
      ),
    );
  }
}

