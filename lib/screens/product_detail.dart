import 'package:dotted_border/dotted_border.dart';
import 'package:drawTask/models/Product.dart';
import 'package:drawTask/service/ProductService.dart';
import 'package:drawTask/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum buttonType { add, remove }

class ProductDetail extends StatefulWidget {
  final int productId;
  const ProductDetail({Key key, @required this.productId}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState(productId);
}

class _ProductDetailState extends State<ProductDetail> {
  double width, height;
  int counter = 0;
  bool isLoading = false;
  Product product;
  final int id;

  _ProductDetailState(this.id);

  @override
  void initState() {
    super.initState();
    getViewDatas();
  }

  Future<void> getViewDatas() async {
    changeLoading();
    product =
        await ProductService().getData("Product/GetProduct/1/" + id.toString());
    changeLoading();
    Fluttertoast.showToast(
        msg: "Ürün Getirildi",
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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(5),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product == null
              ? [buildPaddingProgress(context)]
              : [listBuilder(context), bottomCard, bottomCardBuyContainer],
        ),
      )),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: NewAppBar(
          icon1: Icons.chevron_left,
          func1: () {
            Navigator.pop(context);
          },
          icon2: Icons.favorite,
          func2: () {},
        ));
  }

  Container listBuilder(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.5,
      child: ListView.builder(
        itemCount: product.productPhotos?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            bigProductPhoto(product.productPhotos[index].photoUrl),
      ),
    );
  }

  Container get bottomCardBuyContainer {
    return Container(
      height: height * 0.07,
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.only(left: width * 0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          addRemoveButtons(buttonType.remove),
          SizedBox(width: 20),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                counter.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
          SizedBox(width: 20),
          addRemoveButtons(buttonType.add),
          SizedBox(width: 20),
          buyButton()
        ],
      ),
    );
  }

  FlatButton buyButton() {
    return FlatButton(
      color: Colors.blue[300],
      textColor: Colors.white,
      disabledTextColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.blue[500])),
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Hemen Sipariş Ver",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      onPressed: () {},
    );
  }

  Container addRemoveButtons(button) {
    return Container(
      width: width * 0.11,
      height: 40,
      color: Colors.white,
      child: DottedBorder(
        color: Colors.black45,
        strokeWidth: 0.7,
        child: IconButton(
          icon: Icon(button == buttonType.add ? Icons.add : Icons.remove),
          color: Colors.black45,
          onPressed: () {
            setState(() {
              counter = button == buttonType.add ? counter + 1 : counter - 1;
            });
          },
        ),
      ),
    );
  }

  Container get bottomCard {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 10),
      height: height * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [nameAndMoneyContainer, Spacer(), starBar(product.stars)],
          ),
          Container(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Text(
                product.description,
                style: TextStyle(color: Colors.black45),
              )),
        ],
      ),
    );
  }

  Column get nameAndMoneyContainer {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.productName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Rp " + product.price.toStringAsFixed(2),
          style: TextStyle(
              color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget starBar(double starCount) {
    return RatingBar(
      initialRating: starCount,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 25,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget bigProductPhoto(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image(
              height: 120.0,
              width: width * 0.88,
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover)),
    );
  }
}
