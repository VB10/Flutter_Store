import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchText;

  SearchPage({Key key, @required this.searchText}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
