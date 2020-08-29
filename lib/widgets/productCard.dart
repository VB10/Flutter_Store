import 'package:drawTask/models/subCategories.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function onPressed;
  final List<SubCategoires> subCategory;
  final String subTitle;
  final double price;

  const ProductCard(
      {Key key,
      @required this.imageUrl,
      @required this.name,
      @required this.onPressed,
      this.subCategory,
      this.subTitle,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                  height: 85.0,
                  width: 85.0,
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover)),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                height: 20,
                child: ListView.builder(
                  itemCount: subCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => subCategoryBox(
                      subCategory[index].name, subCategory[index].colorType),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 12, color: Colors.black26),
                  ),
                  SizedBox(
                    width: 63,
                  ),
                  Text(
                    "Rp. " + price.toStringAsFixed(3),
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
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
