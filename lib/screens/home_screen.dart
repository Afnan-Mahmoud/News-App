import 'package:flutter/material.dart';
import 'package:newssssss/screens/search_screen.dart';
import '../layout/models/category_model.dart';
import 'categories_screen.dart';
import 'drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "news";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerItem(onDrawerClick),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.news),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSrearchDelegate());
                  },
                  icon: Icon(Icons.search)),
            )
          ],
          centerTitle: true,
          backgroundColor: const Color(0xff39A552),
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
              borderSide: BorderSide(color: Colors.transparent)),
        ),
        body: model == null
            ? CategoriesScreen(onCategoryClick)
            : NewsScreen(model!));
  }

  CategoryModel? model = null;

  onCategoryClick(categoryModel) {
    model = categoryModel;
    setState(() {});
  }

  onDrawerClick(number) {
    if (number == DrawerItem.CATEGORY) {
      model = null;
      Navigator.pop(context);
      setState(() {});
    } else if (number == DrawerItem.SETTING) {}
  }
}
