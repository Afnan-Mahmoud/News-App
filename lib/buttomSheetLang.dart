import 'package:flutter/material.dart';
import 'package:newssssss/my_provider.dart';
import 'package:provider/provider.dart';

class ButtomSheetLang extends StatelessWidget {
  const ButtomSheetLang({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage('ar');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Arabic',
                      style: pro.language == 'ar'
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black)
                          : Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black)),
                  Spacer(),
                  Icon(Icons.done, color: Colors.black)
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).primaryColor,
            indent: 50,
            endIndent: 50,
          ),
          InkWell(
            onTap: () {
              pro.changeLanguage('en');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('English',
                      style: pro.language != 'ar'
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black)
                          : Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black)),
                  Spacer(),
                  Icon(
                    Icons.done,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
