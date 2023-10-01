import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:newssssss/screens/settings_screen.dart';

class DrawerItem extends StatelessWidget {
  Function onClicked;
  static int CATEGORY = 1;
  static int SETTING = 2;
  DrawerItem(this.onClicked);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            height: 100,
            alignment: Alignment.center,
            child: const Text(
              "News App!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          InkWell(
            onTap: () {
              onClicked(CATEGORY);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.menu_outlined),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.category,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // onClicked(SETTING);
              Navigator.pushNamedAndRemoveUntil(
                  context, SettingScreen.routeName, (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.setting,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
