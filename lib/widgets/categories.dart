import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        categoryCardItem(
            "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
            "Sweet",
            12),
        categoryCardItem(
            "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
            "Sweet",
            12),
        categoryCardItem(
            "https://i2.wp.com/www.eatthis.com/wp-content/uploads/2019/12/how-to-make-donuts-20.jpg?resize=640%2C360&ssl=1",
            "Sweet",
            12),
      ],
    );
  }

  Padding categoryCardItem(imageUrl, categoryName, itemCount) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image(
                  height: 120.0,
                  width: 130.0,
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover)),
          Positioned(
              left: 4,
              bottom: 2,
              child: Row(
                children: [
                  Text(categoryName + " - ",
                      style: TextStyle(color: Colors.black54)),
                  Text(itemCount.toString() + " Item",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              )),
        ],
      ),
    );
  }
}
