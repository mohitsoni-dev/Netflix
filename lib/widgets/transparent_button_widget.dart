import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onTap;

  TransparentButton(
      {@required this.icon, @required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      onPressed: onTap,
      child: Column(
        children: [
          icon,
          Text(
            title,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
