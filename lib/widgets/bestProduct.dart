import 'package:flutter/material.dart';
import 'package:drawTask/models/subCategories.dart';
import 'package:drawTask/widgets/icon_button.dart';
import 'package:drawTask/widgets/productCard.dart';

class BestProduct extends StatelessWidget {
  const BestProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      color: Colors.black12,
      height: 359,
      width: double.infinity,
      child: Column(
        children: [
          topPopular(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, right: 30),
            child: SizedBox(
              width: double.infinity,
              height: 271,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ProductCard(
                      productId: 1,
                      imageUrl:
                          "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
                      name: "Banana Goreng",
                      subTitle: "Warung buyayuk",
                      subCategory: fillSubs(),
                      price: 2.500,
                      onPressed: null),
                  ProductCard(
                      productId: 1,
                      imageUrl:
                          "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
                      name: "Banana Goreng",
                      subTitle: "Warung buyayuk",
                      subCategory: fillSubs(),
                      price: 2.500,
                      onPressed: null),
                  ProductCard(
                      productId: 1,
                      imageUrl:
                          "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
                      name: "Banana Goreng",
                      subTitle: "Warung buyayuk",
                      subCategory: fillSubs(),
                      price: 2.500,
                      onPressed: null),
                  ProductCard(
                      productId: 1,
                      imageUrl:
                          "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
                      name: "Banana Goreng",
                      subTitle: "Warung buyayuk",
                      subCategory: fillSubs(),
                      price: 2.500,
                      onPressed: null),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row topPopular() {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: IconButtons(
              icon: Icons.favorite,
              color: Colors.white,
              onPressed: () {},
            )),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Monggo, entekno duwekmul",
              style: TextStyle(fontSize: 12, color: Colors.black26),
            ),
          ],
        ),
        Spacer(),
        IconButtons(icon: Icons.arrow_forward, onPressed: () {})
      ],
    );
  }
}
