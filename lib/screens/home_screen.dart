import 'package:drawTask/screens/product_detail.dart';
import 'package:drawTask/widgets/bestProduct.dart';
import 'package:drawTask/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'search_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      child: CategoryCard(),
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
