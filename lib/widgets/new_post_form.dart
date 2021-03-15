import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wasteagram/db/food_waste_post_dto.dart';

class NewPostForm extends StatefulWidget {
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
    );
  }

}
