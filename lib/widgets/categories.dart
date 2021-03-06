import 'package:drawTask/models/Categories.dart';
import 'package:drawTask/widgets/paddingProgress.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final List<Categories> categories;

  const CategoryCard({Key key, @required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categories.length == 0
        ? buildPaddingProgress(context)
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                categoryCardItem(categories[index]),
          );
  }

  Padding categoryCardItem(Categories category) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Stack(
        children: [
          categoryPhoto(category),
          categoryText(category),
        ],
      ),
    );
  }

  ClipRRect categoryPhoto(Categories category) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image(
            height: 120.0,
            width: 130.0,
            image: NetworkImage(category.photoUrl),
            fit: BoxFit.cover));
  }

  Positioned categoryText(Categories category) {
    return Positioned(
        left: 4,
        bottom: 2,
        child: Row(
          children: [
            Text(category.categoryName + " - ",
                style: TextStyle(color: Colors.black54)),
            Text(category.totalItem.toString() + " Item",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ));
  }
}
