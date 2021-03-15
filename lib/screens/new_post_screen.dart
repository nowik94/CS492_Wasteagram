import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:wasteagram/widgets/new_post_form.dart';

// screen where a user will be able to create a new post and upload photo
class NewPostScreen extends StatefulWidget {
  // routename
  static const routeName = 'newPost';

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  LocationData locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  /*
  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {

    });
  }*/

  //
  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    File recievedImage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram')),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: Image.file(recievedImage)),
              ),
              NewPostForm(receivedImage: recievedImage, locationData: locationData,),
            ],
          )
          //child:
      )
    );
  }
}
