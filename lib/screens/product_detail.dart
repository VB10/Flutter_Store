import 'package:dotted_border/dotted_border.dart';
import 'package:drawTask/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum buttonType { add, remove }

class ProductDetail extends StatefulWidget {
  final int productId;
  const ProductDetail({Key key, @required this.productId}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int counter = 0;
  double width, height;
  String imageUrl =
      "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: NewAppBar(
            icon1: Icons.chevron_left,
            func1: () {
              Navigator.pop(context);
            },
            icon2: Icons.favorite,
            func2: () {},
          )),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(5),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                children: [
                  bigProductPhoto(imageUrl),
                  bigProductPhoto(imageUrl),
                  bigProductPhoto(imageUrl),
                ],
              ),
            ),
            bottomCard(),
            bottomCardBuyContainer()
          ],
        ),
      )),
    );
  }

  Container bottomCardBuyContainer() {
    return Container(
      height: height * 0.07,
      padding: EdgeInsets.only(left: width * 0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          "Gas, Lanjutkan",
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

  Container bottomCard() {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 10),
      height: height * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ice Creamy",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rp 12.000",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              starBar(4)
            ],
          ),
          Container(
              padding: EdgeInsets.only(top: height * 0.04),
              child: Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                style: TextStyle(color: Colors.black45),
              )),
        ],
      ),
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
