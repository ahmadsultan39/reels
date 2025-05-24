import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/reel.dart';
import '../../domain/repositories/reels_repository.dart';
import '../data_sources/local/reels_local_data_source.dart';
import '../data_sources/remote/reels_remote_data_source.dart';
import '../models/reel_model.dart';

@LazySingleton(as: ReelsRepository)
class ReelsRepositoryImpl extends BaseRepositoryImpl
    implements ReelsRepository {
  final ReelsRemoteDataSource remoteDataSource;
  final ReelsLocalDataSource localDataSource;

  ReelsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Reel>>> getReels(int page) async {
    try {
      if (await localDataSource.hasValidCache(page)) {
        final cachedReels = await localDataSource.getCachedReels(page);
        if (cachedReels.isNotEmpty) {
          final reels = cachedReels.cast<Reel>();
          return Right(reels);
        }
      }

      return await requestApi<List<ReelModel>>(() async {
        final reels = await remoteDataSource.getReels(page);
        await localDataSource.cacheReels(reels, page);
        return reels;
      });
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
