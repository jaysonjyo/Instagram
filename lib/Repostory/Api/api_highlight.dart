import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';

import '../ModelClass/highlightModel.dart';
import 'api_client.dart';

class HighlightApi {
  ApiClient apiClient = ApiClient();
  Future<HighlightModel> gethighlight(String Highlights) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/highlights?username_or_id_or_url=$Highlights';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return HighlightModel.fromJson(jsonDecode(response.body));
  }
}