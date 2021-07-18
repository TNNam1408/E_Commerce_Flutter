import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final Function onChanged;
  final String name;


  MyTextFormField({this.onChanged, this.validator, this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelText: name,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
    );
  }
}
