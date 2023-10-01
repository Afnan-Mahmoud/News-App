import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newssssss/layout/models/news_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "Details";
  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title ?? ""),
        centerTitle: true,
        backgroundColor: const Color(0xff39A552),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                child: Image.network(
                  articles.urlToImage ?? "",
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                articles.title ?? "",
                // maxLines: 1,
                style: GoogleFonts.aBeeZee(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    articles.publishedAt?.substring(0, 10) ?? "",
                    style: TextStyle(fontSize: 10),
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                articles.description ?? "",
                maxLines: 10,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View Full Article",
                    style: TextStyle(fontSize: 13),
                  ),
                  IconButton(
                      onPressed: () {
                        _launchUrl(articles.url ?? "");
                      },
                      icon: Icon(
                        Icons.arrow_right,
                        size: 24,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String Url) async {
    var _url = Uri.parse(Url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
}
