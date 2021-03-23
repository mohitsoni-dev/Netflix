import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String type;
  final IconData icon;
  final Function onPressed;
  InputField({
    @required this.label,
    @required this.type,
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType:
            type == 'email' ? TextInputType.emailAddress : TextInputType.text,
        onChanged: onPressed,
        autocorrect: type != 'password',
        obscureText: type == 'password',
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey[700],
          ),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
    );
  }
}
