import 'package:flutter/material.dart';

// FAB that will open used to go to the
class CameraFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {

      },
      child: const Icon(Icons.photo_camera)
    );
  }
}
