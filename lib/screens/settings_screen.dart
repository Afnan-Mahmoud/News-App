//import 'dart:js';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newssssss/layout/models/category_model.dart';
import 'package:newssssss/screens/drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:newssssss/buttomSheetLang.dart';
import 'package:newssssss/my_provider.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "setting";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      drawer: DrawerItem(onDrawerClick),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setting),
        /* leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_outlined),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),*/ //
        centerTitle: true,
        backgroundColor: const Color(0xff39A552),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.lang,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green)),
              child: Row(
                children: [
                  Text(
                    provider.language == "en" ? "English" : "Arabic",
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        showBottomSheetLanguage(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheetLanguage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ButtomSheetLang();
      },
    );
  }

  CategoryModel? model = null;

  onCategoryClick(categoryModel) {
    model = categoryModel;
    setState(() {});
  }

  onDrawerClick(number) {
    if (number == DrawerItem.CATEGORY) {
      var model = null;
      Navigator.pop(context);
      setState(() {});
    } else if (number == DrawerItem.SETTING) {}
  }
}
