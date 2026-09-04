import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/service/network__service/api_endpoints.dart';

class NetworkService {
  Future<dynamic> getData(
    String endPoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final uri = Uri.parse(
        "${ApiEndpoints.baseUrl}$endPoint",
      ).replace(queryParameters: params);
      final response = await http.get(
        uri,
        headers: {"x-api-key": ApiEndpoints.apiKey},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
