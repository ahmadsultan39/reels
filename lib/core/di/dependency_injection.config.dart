// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/reels/data/data_sources/local/reels_local_data_source.dart'
    as _i490;
import '../../features/reels/data/data_sources/remote/reels_remote_data_source.dart'
    as _i298;
import '../../features/reels/data/repositories/reels_repository_impl.dart'
    as _i1070;
import '../../features/reels/domain/repositories/reels_repository.dart'
    as _i695;
import '../../features/reels/domain/use_cases/get_reels_use_case.dart' as _i333;
import '../../features/reels/presentation/bloc/reels_bloc.dart' as _i1056;
import '../repositories/base_repository.dart' as _i421;
import '../repositories/base_repository_impl.dart' as _i432;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i298.ReelsRemoteDataSource>(
      () => _i298.ReelsRemoteDataSourceImpl());
  gh.lazySingleton<_i490.ReelsLocalDataSource>(
      () => _i490.ReelsLocalDataSourceImpl());
  gh.lazySingleton<_i421.BaseRepository>(() => _i432.BaseRepositoryImpl());
  gh.lazySingleton<_i695.ReelsRepository>(() => _i1070.ReelsRepositoryImpl(
        remoteDataSource: gh<_i298.ReelsRemoteDataSource>(),
        localDataSource: gh<_i490.ReelsLocalDataSource>(),
      ));
  gh.lazySingleton<_i333.GetReelsUseCase>(
      () => _i333.GetReelsUseCase(gh<_i695.ReelsRepository>()));
  gh.factory<_i1056.ReelsBloc>(
      () => _i1056.ReelsBloc(gh<_i333.GetReelsUseCase>()));
  return getIt;
}
