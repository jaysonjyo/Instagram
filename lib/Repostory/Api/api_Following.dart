import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/FollowingModel.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import '../ModelClass/FollowersModel.dart';
import '../ModelClass/highlightModel.dart';
import 'api_client.dart';

class FollowingApi {
  ApiClient apiClient = ApiClient();
  Future<FollowingModel> getFollowing(String followingid) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/following?username_or_id_or_url=$followingid';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return FollowingModel.fromJson(jsonDecode(response.body));
  }
}