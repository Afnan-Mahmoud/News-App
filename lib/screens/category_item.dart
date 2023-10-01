import 'package:flutter/material.dart';

import '../layout/models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryItem(this.categoryModel, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: index.isEven ? Radius.circular(25) : Radius.zero,
              bottomRight: index.isOdd ? Radius.circular(25) : Radius.zero)),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(
            categoryModel.name,
            style: GoogleFonts.elMessiri(fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }
}
