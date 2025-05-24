import 'package:flutter/material.dart';
import '../models/base_model.dart';

import 'exceptions.dart';

Exception statusCodeHandler(BaseModel response) {
  try {
    /// Get the message
    final String? errorMessage = response.message;

    /// StatusCode: 400
    if (response.statusCode == 400) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing BadRequestException\n');

      return BadRequestException(
        error: errorMessage ?? "Bad Request",
      );
    }

    /// StatusCode: 401
    else if (response.statusCode == 401) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing UnauthorizedException\n');

      return UnauthorizedException(
        error: errorMessage ?? "Unauthorized",
      );
    }

    /// StatusCode: 403
    else if (response.statusCode == 403) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ForbiddenException\n');

      return ForbiddenException(
        error: errorMessage ?? "Forbidden",
      );
    }

    /// StatusCode: 404
    else if (response.statusCode == 404) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing NotFoundException\n');

      return NotFoundException(
        error: errorMessage ?? "Not Found",
      );
    }


    /// StatusCode: 412
    else if (response.statusCode == 412) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing UnprocessableEntityException\n');

      return UnprocessableEntityException(
        error: errorMessage ?? "Unprocessable Entity",
      );
    }

    /// StatusCode: 500
    else if (response.statusCode == 500) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing InternalServerErrorException\n');

      return InternalServerErrorException(
        error: errorMessage ?? "Internal Server Error",
      );
    }

    /// StatusCode: 503
    else if (response.statusCode == 503) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ServiceUnavailableException\n');

      return ServiceUnavailableException(
        error: errorMessage ?? "Service Unavailable",
      );
    }

    /// StatusCode: unknown
    else {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ServerException\n');

      return ServerException(
        error: errorMessage ?? "Something went wrong",
      );
    }
  } catch (e) {
    debugPrint("Failed to get the message form the response because $e\n");
    return ServerException(error: "Something went wrong");
  }
}
