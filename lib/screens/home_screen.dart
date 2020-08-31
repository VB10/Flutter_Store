import 'dart:convert';
import 'dart:io';

import 'package:drawTask/models/Categories.dart';
import 'package:drawTask/screens/product_detail.dart';
import 'package:drawTask/widgets/bestProduct.dart';
import 'package:drawTask/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final baseUrl = "https://localhost:44387/api";
  bool isLoading = false;
  List<Categories> categories = [];
  @override
  void initState() {
    super.initState();
    callItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHttpCats();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (categories.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getHttpCats() async {
    final response =
        await http.get('https://hasansahin.net/api/Categories/Getall');
    print(response);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        print(jsonBody);
        if (jsonBody is List)
          categories = jsonBody.map((e) => Categories.fromJson(e)).toList();
        break;
      default:
    }
  }

  TextEditingController searchController = new TextEditingController();
  double width, height;
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width - 30;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: NewAppBar(
            icon1: Icons.chevron_left,
            func1: () {},
            icon2: Icons.short_text,
            func2: () {},
          )),
      body: SafeArea(
          child: Column(
        children: [
          secondPart(),
          categoryCards(),
          SizedBox(height: 15),
          BestProduct()
        ],
      )),
    );
  }

  Container categoryCards() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, top: 25),
      color: Colors.white,
      height: 170,
      width: double.infinity,
      child: CategoryCard(
        categories: categories,
      ),
    );
  }

  Padding secondPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 7, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: !showSearch
                ? Text(
                    "What do you want to eat today?",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
                  )
                : Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.fastfood, color: Colors.black87),
                          hintText: "Search you're looking for",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    )),
          ),
          Flexible(
            flex: !showSearch ? 2 : 1,
            child: IconButtons(
                icon: !showSearch ? Icons.search : Icons.arrow_forward,
                onPressed: () {
                  !showSearch
                      ? setState(() {
                          showSearch = !showSearch;
                        })
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              productId: 5,
                            ),
                          ));
                }),
          )
        ],
      ),
    );
  }
}
