import 'package:flutter/material.dart';
import 'package:udemy_flutter/widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> categoryInfo = [
    {
      'imagePath': 'assets/images/cat/fruits.png',
      'categoryText': 'Fruits',
      'cardColor': const Color(0xff53B175)
    },
    {
      'imagePath': 'assets/images/cat/veg.png',
      'categoryText': 'Vegetables',
      'cardColor': const Color(0xffF8A44C)
    },
    {
      'imagePath': 'assets/images/cat/Spinach.png',
      'categoryText': 'Herbs',
      'cardColor': const Color(0xffF7A593)
    },
    {
      'imagePath': 'assets/images/cat/nuts.png',
      'categoryText': 'Nuts',
      'cardColor': const Color(0xffD380E0)
    },
    {
      'imagePath': 'assets/images/cat/spices.png',
      'categoryText': 'Spices',
      'cardColor': const Color(0xffFDE598)
    },
    {
      'imagePath': 'assets/images/cat/grains.png',
      'categoryText': 'Grains',
      'cardColor': const Color(0xffB7DFF5)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              categoryText: categoryInfo[index]['categoryText'],
              imagePath: categoryInfo[index]['imagePath'],
              cardColor: categoryInfo[index]['cardColor'],
            );
          }),
        ),
      ),
    );
  }
}
