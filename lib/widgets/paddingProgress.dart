import 'package:flutter/material.dart';

Widget buildPaddingProgress(context) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.12),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );
}
