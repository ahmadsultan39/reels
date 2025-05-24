import 'package:flutter/material.dart';

import '../../models/base_model.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<dynamic> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });
}
