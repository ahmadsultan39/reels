import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../error/failures.dart';

abstract class BaseRepository {
  @protected
  Future<Either<Failure, T>> requestApi<T>(Future<T> Function() apiRequest);
}