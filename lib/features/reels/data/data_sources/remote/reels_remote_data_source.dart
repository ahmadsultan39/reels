import 'package:injectable/injectable.dart';

import '../../../../../core/data_sources/remote/base_remote_data_source.dart';
import '../../../../../core/data_sources/remote/base_remote_data_source_impl.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/reel_model.dart';

abstract class ReelsRemoteDataSource extends BaseRemoteDataSource {
  Future<List<ReelModel>> getReels(int page);
}

@LazySingleton(as: ReelsRemoteDataSource)
class ReelsRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ReelsRemoteDataSource {
  @override
  Future<List<ReelModel>> getReels(int page) async {
    final response = await performGetRequest(
      endpoint: Endpoints.reels,
      queryParameters: {"page": page.toString(), "limit": '10'},
    );
    return (response.data["data"] as List)
        .map((element) => ReelModel.fromJson(element))
        .toList();
  }
}
