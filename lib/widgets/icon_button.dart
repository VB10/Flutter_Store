import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;

  const IconButtons(
      {Key key, @required this.icon, this.color, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 32.0,
      disabledColor: Colors.red,
      color: color == null ? Colors.black : color,
      onPressed: onPressed,
    );
  }
}
