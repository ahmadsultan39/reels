class HandledException implements Exception {
  String? error;

  HandledException({this.error = ''});
}

class ParseException implements Exception {
  ParseException({String error = 'Parse Error'});
}

class ServerException extends HandledException {
  ServerException({super.error});
}

class NullDataException extends ServerException {
  NullDataException({super.error});
}

class UnauthorizedException extends ServerException {
  UnauthorizedException({super.error});
}

class UnprocessableEntityException extends ServerException
    implements Exception {
  UnprocessableEntityException({super.error});
}

class BadRequestException extends ServerException {
  BadRequestException({super.error});
}

class ForbiddenException extends ServerException {
  ForbiddenException({super.error});
}

class NotFoundException extends ServerException {
  NotFoundException({super.error});
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException({super.error});
}

class ServiceUnavailableException extends ServerException {
  ServiceUnavailableException({super.error});
}

class CacheException extends HandledException {
  CacheException({super.error});
}