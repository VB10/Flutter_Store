import 'package:drawTask/models/Product.dart';
import 'package:drawTask/widgets/paddingProgress.dart';
import 'package:flutter/material.dart';
import 'package:drawTask/widgets/icon_button.dart';
import 'package:drawTask/widgets/productCard.dart';

class BestProduct extends StatelessWidget {
  final List<Product> products;

  const BestProduct({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      color: Colors.black12,
      height: 359,
      width: double.infinity,
      child: Column(
        children: [
          topPopular,
          SizedBox(
            height: 10,
          ),
          bestListBuilder(context)
        ],
      ),
    );
  }

  Row get topPopular {
    return Row(
      children: [
        popularIcon,
        SizedBox(
          width: 10,
        ),
        popularTexts,
        Spacer(),
        IconButtons(icon: Icons.arrow_forward, onPressed: () {})
      ],
    );
  }

  Container get popularIcon {
    return Container(
        decoration: BoxDecoration(
            color: Colors.red[300],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButtons(
          icon: Icons.favorite,
          color: Colors.white,
          onPressed: () {},
        ));
  }

  Column get popularTexts {
    return Column(
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
    );
  }

  Padding bestListBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, right: 30),
      child: SizedBox(
          width: double.infinity,
          height: 271,
          child: products.length == 0
              ? buildPaddingProgress(context)
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: products[index]),
                )),
    );
  }
}
