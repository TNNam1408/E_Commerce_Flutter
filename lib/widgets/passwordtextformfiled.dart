import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;
  final Function onChanged;


  PasswordTextFormField(
      {this.onChanged,
        this.obserText,
        this.validator,
        this.name,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off, color: Colors.black,),
        ),
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
