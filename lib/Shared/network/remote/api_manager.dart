import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../layout/models/news_data_model.dart';
import '../../../layout/models/sources_response.dart';
import '../../components/constansts.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.http("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "64cf0cc309e043d9a3012db8071a9151", "category": categoryId});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
    return sourcesResponse;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/everything",
        {"apiKey": Constants.API_KEY, "sources": sourceId});
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }

  static Future<NewsDataModel> search(String quary) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/everything",
        {"apiKey": Constants.API_KEY, "q": quary});
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
