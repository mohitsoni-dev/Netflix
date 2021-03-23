import 'package:flutter/material.dart';

class LargeOutlinedBtn extends StatelessWidget {
  final String label;
  final Function onPressed;
  LargeOutlinedBtn({@required this.label, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      height: 50.0,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
