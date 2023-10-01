import 'package:flutter/material.dart';

import '../layout/models/category_model.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  Function onCategoryClick;
  CategoriesScreen(this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  onCategoryClick(categories[index]);
                },
                child: CategoryItem(categories[index], index));
          }),
    );
  }
}
