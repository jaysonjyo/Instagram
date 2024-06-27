import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import 'api_client.dart';

class InstaApi {
  ApiClient apiClient = ApiClient();
  Future<InstagramModel> getInstagram(String id) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/info?username_or_id_or_url=$id';
    var body = {
      
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return InstagramModel.fromJson(jsonDecode(response.body));
  }
}