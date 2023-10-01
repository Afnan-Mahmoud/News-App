import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newssssss/screens/source_item.dart';
import '../Shared/network/remote/api_manager.dart';
import '../layout/models/sources_response.dart';
import 'news_item.dart';

class SourcesTitle extends StatefulWidget {
  List<Sources> sources;
  SourcesTitle(
    this.sources,
  );

  @override
  State<SourcesTitle> createState() => _SourcesTitleState();
}

class _SourcesTitleState extends State<SourcesTitle> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources.map((e) {
                  return SourceItem(
                      e.name ?? "", widget.sources.indexOf(e) == index);
                }).toList())),
        FutureBuilder(
            future: ApiManager.getNewsData(widget.sources[index].id ?? ""),
            builder: (context, snapshot) {
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
            })
      ],
    );
  }
}
