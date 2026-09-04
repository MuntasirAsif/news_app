import 'dart:developer';

import '../../../core/service/network__service/api_endpoints.dart';
import '../../../core/service/network__service/network_service.dart';
import '../model/source_model.dart';

class SourceController {
  SourceModel? sourceModel;
  bool isLoading = false;
  String? error;

  Future getSource() async {
    isLoading = true;
    try {
      log("APi calling");
      final response = await NetworkService().getData(ApiEndpoints.sources);
      sourceModel = SourceModel.fromJson(response);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      error = e.toString();
    }
  }
}
