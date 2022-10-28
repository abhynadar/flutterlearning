import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_flutter/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.categoryText,
      required this.imagePath,
      required this.cardColor})
      : super(key: key);

  final String categoryText, imagePath;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {
        print('Category pressed');
      },
      child: Container(
        decoration: BoxDecoration(
            color: cardColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardColor.withOpacity(0.7), width: 2)),
        child: Column(children: [
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.fill),
            ),
          ),
          TextWidget(
            text: categoryText,
            color: color,
            textSize: 20,
            isTitle: true,
          )
        ]),
      ),
    );
  }
}
