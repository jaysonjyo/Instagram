import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import '../ModelClass/PostModels.dart';
import 'api_client.dart';

class PostApi {
  ApiClient apiClient = ApiClient();
  Future<PostModels> getpost(String post) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1.2/posts?username_or_id_or_url=$post';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return PostModels.fromJson(jsonDecode(response.body));
  }
}