import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/reel.dart';
import '../repositories/reels_repository.dart';

@LazySingleton()
class GetReelsUseCase {
  final ReelsRepository repository;

  GetReelsUseCase(this.repository);

  Future<Either<Failure, List<Reel>>> call(int page) async {
    return await repository.getReels(page);
  }
}
