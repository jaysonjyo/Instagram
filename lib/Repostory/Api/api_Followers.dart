import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import '../ModelClass/FollowersModel.dart';
import '../ModelClass/highlightModel.dart';
import 'api_client.dart';

class FolloweresApi {
  ApiClient apiClient = ApiClient();
  Future<FollowersModel> getFollowers(String followerid) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/followers?username_or_id_or_url=$followerid';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return FollowersModel.fromJson(jsonDecode(response.body));
  }
}