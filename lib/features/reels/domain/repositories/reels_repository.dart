import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/reel.dart';

abstract class ReelsRepository extends BaseRepository {
  Future<Either<Failure, List<Reel>>> getReels(int page);
}
