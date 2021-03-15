import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/new_post_form.dart';

// screen where a user will be able to create a new post and upload photo

class NewPostScreen extends StatelessWidget {

  // routename
  static const routeName = 'newPost';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Wasteagram')),
      body: SafeArea(child: NewPostForm())
    );
  }
}
