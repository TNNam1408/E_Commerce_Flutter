import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  MyButton({this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.blueGrey,
        child: Text(name),
        onPressed: onPressed,
      ),
    );
  }
}
