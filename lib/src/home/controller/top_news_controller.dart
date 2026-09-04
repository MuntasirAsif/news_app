import 'dart:developer';

import 'package:news_app/src/home/model/top_news.dart';

import '../../../core/service/network__service/api_endpoints.dart';
import '../../../core/service/network__service/network_service.dart';

class TopNewsController {
  TopNews? topNews;
  bool isLoading = false;
  String? error;

  Future getTopNews(Map<String, String>? params) async {
    isLoading = true;
    try {
      log("APi calling");
      final response = await NetworkService().getData(
        ApiEndpoints.topHeadlines,
        params: params,
      );
      topNews = TopNews.fromJson(response);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      error = e.toString();
    }
  }
}
