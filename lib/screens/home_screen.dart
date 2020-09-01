import 'dart:async';

import 'package:drawTask/models/Categories.dart';
import 'package:drawTask/models/Product.dart';
import 'package:drawTask/screens/product_detail.dart';
import 'package:drawTask/service/CategoriesService.dart';
import 'package:drawTask/service/ProductService.dart';
import 'package:drawTask/widgets/bestProduct.dart';
import 'package:drawTask/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final baseUrl = "https://localhost:44387/api";
  bool isLoading = false;
  List<Categories> categories = [];
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    getViewDatas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getViewDatas() async {
    changeLoading();
    categories = await CategoriesService().getData("Categories/GetAll2");
    products = await ProductService().getData("Product/GetMostPopular");
    changeLoading();
    Fluttertoast.showToast(
        msg: "Veriler Getirildi",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        webPosition: "bottom",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[300]);
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  /* void checkErrorList() {
    if (categories.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }*/

  TextEditingController searchController = new TextEditingController();
  double width, height;
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width - 30;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
          child: Column(
        children: [
          secondPart(),
          categoryCards(),
          SizedBox(height: 15),
          BestProduct(
            products: products,
          )
        ],
      )),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: NewAppBar(
          icon1: Icons.refresh,
          func1: () {
            getViewDatas();
          },
          icon2: Icons.short_text,
          func2: () {},
        ));
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
        children: [searchPart(), searchButton()],
      ),
    );
  }

  Flexible searchPart() {
    return Flexible(
      flex: 4,
      child: !showSearch
          ? Text(
              "What do you want to eat today?",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
            )
          : searchContainer(),
    );
  }

  Container searchContainer() {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(244, 243, 243, 1),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.fastfood, color: Colors.black87),
              hintText: "Search you're looking for",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
        ));
  }

  Flexible searchButton() {
    return Flexible(
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
    );
  }
}
