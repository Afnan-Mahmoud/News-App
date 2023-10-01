import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String name;
  Color color;
  String image;
  CategoryModel(this.id, this.name, this.color, this.image);

  static List<CategoryModel> getCategories() {
    BuildContext context;
    return [
      CategoryModel(
          "business",
          "Business"
          //AppLocalizations.of(context)!.business
          ,
          Color(0xffCF7E48),
          "assets/images/bussines.png"),
      CategoryModel("entertainment", "Entertainment", Color(0xff4882CF),
          "assets/images/environment.png"),
      CategoryModel("general", "General", Color(0xff48cf75),
          "assets/images/environment.png"),
      CategoryModel(
          "health", "Health", Color(0xffED1E79), "assets/images/health.png"),
      CategoryModel(
          "science", "Science", Color(0xffF2D352), "assets/images/science.png"),
      CategoryModel(
          "sports", "Sports", Color(0xffC91C22), "assets/images/sports.png"),
      CategoryModel("technology", "Technology", Color(0xff003E90),
          "assets/images/bussines.png"),
    ];
  }
}
