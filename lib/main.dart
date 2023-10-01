import 'package:flutter/material.dart';
import 'package:newssssss/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newssssss/screens/news_details.dart';
import 'package:newssssss/screens/settings_screen.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) {
        return MyProvider()..getLanguage();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //  GlobalWidgetsLocalizations.delegate,
      //  GlobalCupertinoLocalizations.delegate,
      //  ],
      locale: Locale(provider.language),

      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
        NewsDetails.routeName: (context) => NewsDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
