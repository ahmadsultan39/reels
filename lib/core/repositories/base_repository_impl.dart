import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../error/failures.dart';
import 'base_repository.dart';

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {

  @override
  Future<Either<Failure, T>> requestApi<T>(
      Future<T> Function() apiRequest) async {
    try {
      return Right(await apiRequest());
    } catch (e) {
      debugPrint("Error from Repository: $e");
      final Failure failure = handleFailureError(e);
      return Left(failure);
    }
  }
}
