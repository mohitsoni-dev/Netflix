import 'package:flutter/material.dart';

class LargeElevatedBtn extends StatelessWidget {
  final String label;
  final Function onPressed;
  LargeElevatedBtn({@required this.label, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
      ),
    );
  }
}
