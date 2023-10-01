import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newssssss/screens/news_details.dart';
import '../layout/models/news_data_model.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  NewsItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,
            arguments: articles);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
                maxLines: 1,
                style: GoogleFonts.aBeeZee(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                articles.description ?? "",
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(articles.author ?? "",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      )),
                  Text(articles.publishedAt?.substring(0, 10) ?? ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
