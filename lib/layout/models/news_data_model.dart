import 'SourcesResponse.dart';

class NewsDataModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsDataModel({this.status, this.totalResults, this.articles});

  NewsDataModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["totalResults"] is int) {
      totalResults = json["totalResults"];
    }
    if (json["articles"] is List) {
      articles = json["articles"] == null
          ? null
          : (json["articles"] as List)
              .map((e) => Articles.fromJson(e))
              .toList();
    }
  }
}

class Articles {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    if (json["source"] is Map) {
      source = json["source"] == null ? null : Sources.fromJson(json["source"]);
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["urlToImage"] is String) {
      urlToImage = json["urlToImage"];
    }
    if (json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if (json["content"] is String) {
      content = json["content"];
    }
  }
}
