import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../error/exceptions.dart';
import '../../error/status_code_handler.dart';
import '../../models/base_model.dart';
import '../../network/endpoints.dart';
import 'base_remote_data_source.dart';

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  @override
  Future<BaseModel> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('${Endpoints.baseUrl}$endpoint').replace(queryParameters: queryParameters);
      final response = await http.get(uri);
      final BaseModel baseModel = BaseModel.fromJson(
        json.decode(response.body),
      );
      if (baseModel.statusCode == 200) {
        return baseModel;
      } else {
        throw statusCodeHandler(baseModel);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
