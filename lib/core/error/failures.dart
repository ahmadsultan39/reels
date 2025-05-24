import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure(this.error, [List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({String error = ""}) : super(error);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String error = ""}) : super(error);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({String error = ""}) : super(error);
}

class CacheFailure extends Failure {
  const CacheFailure({String error = ""}) : super(error);
}

class RepositoryFailure extends Failure {
  const RepositoryFailure({String error = ""}) : super(error);
}

Failure handleFailureError(dynamic error) {
  if (error is ServerException) {
    return ServerFailure(error: error.error ?? "");
  } else if (error is CacheException) {
    return CacheFailure(error: error.error ?? "");
  } else {
    return const ServerFailure();
  }
}