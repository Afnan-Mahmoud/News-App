import 'package:flutter/material.dart';
import 'package:newssssss/layout/models/category_model.dart';
import 'package:newssssss/screens/news_item.dart';
import '../Shared/network/remote/api_manager.dart';

class CustomSrearchDelegate extends SearchDelegate {
  var categoryModel = CategoryModel.getCategories();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.search(query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong!"));
          }
          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(articles[index]);
              },
              itemCount: articles.length,
            ),
          );
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.search(query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong!"));
          }
          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(articles[index]);
              },
              itemCount: articles.length,
            ),
          );
        }));
  }
}
