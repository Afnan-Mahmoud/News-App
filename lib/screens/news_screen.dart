import 'package:flutter/material.dart';
import 'package:newssssss/screens/sources_title.dart';

import '../Shared/network/remote/api_manager.dart';
import '../layout/models/category_model.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;
  NewsScreen(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("something went wrong!"));
        }
        var sources = snapshot.data?.sources ?? [];
        return SourcesTitle(sources);
      },
    );
  }
}
