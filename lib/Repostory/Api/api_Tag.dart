import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import '../ModelClass/TagModel.dart';
import 'api_client.dart';

class TagApi {
  ApiClient apiClient = ApiClient();
  Future<TagModel> getTag(String tag) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/tagged?username_or_id_or_url=$tag';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return TagModel.fromJson(jsonDecode(response.body));
  }
}