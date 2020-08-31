import 'package:drawTask/models/Product.dart';
import 'package:drawTask/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(
                productId: product.id,
              ),
            ));
      },
      child: productDesign,
    );
  }

  Container get productDesign {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardPhoto,
          SizedBox(
            width: 10,
          ),
          bottomTab,
        ],
      ),
    );
  }

  ClipRRect get cardPhoto {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image(
            height: 85.0,
            width: 85.0,
            image: NetworkImage(product.defaultPhoto),
            fit: BoxFit.cover));
  }

  Column get bottomTab {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.productName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        subCategories,
        SizedBox(
          height: 15,
        ),
        pricePlace,
      ],
    );
  }

  SizedBox get subCategories {
    return SizedBox(
      width: 200,
      height: 20,
      child: ListView.builder(
        itemCount: product.subCategories?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => subCategoryBox(
            product.subCategories[index].subCategoryName,
            product.subCategories[index].colorType),
      ),
    );
  }

  Row get pricePlace {
    return Row(
      children: [
        Text(
          product.subtitle,
          style: TextStyle(fontSize: 12, color: Colors.black26),
        ),
        SizedBox(
          width: 63,
        ),
        Text(
          "Rp. " + product.price.toStringAsFixed(2),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container subCategoryBox(name, type) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: getmainColor(type, 100)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2, right: 8, bottom: 2),
        child: Text(
          name,
          style: TextStyle(
              color: getmainColor(type, 400),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              backgroundColor: getmainColor(type, 100)),
        ),
      ),
    );
  }
}

Color getmainColor(type, weight) {
  Color color;
  switch (type) {
    case 1:
      color = Colors.green[weight];
      break;
    case 2:
      color = Colors.blue[weight];
      break;
    case 3:
      color = Colors.orange[weight];
      break;
    case 4:
      color = Colors.red[weight];
      break;
    default:
  }
  return color;
}
