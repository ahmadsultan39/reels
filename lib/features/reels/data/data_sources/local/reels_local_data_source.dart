import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../models/reel_model.dart';

abstract class ReelsLocalDataSource {
  Future<List<ReelModel>> getCachedReels(int page);
  Future<void> cacheReels(List<ReelModel> reels, int page);
  Future<void> clearCache();
  Future<bool> hasValidCache(int page);
}

@LazySingleton(as: ReelsLocalDataSource)
class ReelsLocalDataSourceImpl implements ReelsLocalDataSource {
  static const String _boxName = 'reels_cache';
  static const String _pagePrefix = 'page_';
  static const String _timestampPrefix = 'timestamp_';
  static const Duration _cacheValidDuration = Duration(hours: 1);

  Box<dynamic>? _box;

  Future<Box<dynamic>> get box async {
    _box ??= await Hive.openBox(_boxName);
    return _box!;
  }

  @override
  Future<List<ReelModel>> getCachedReels(int page) async {
    final cacheBox = await box;
    final cachedData = cacheBox.get('$_pagePrefix$page');

    if (cachedData != null) {
      return (cachedData as List)
          .map((json) => ReelModel.fromJson(Map<String, dynamic>.from(json)))
          .toList();
    }

    return [];
  }

  @override
  Future<void> cacheReels(List<ReelModel> reels, int page) async {
    final cacheBox = await box;
    final jsonList = reels.map((reel) => reel.toJson()).toList();

    await cacheBox.put('$_pagePrefix$page', jsonList);
    await cacheBox.put(
      '$_timestampPrefix$page',
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  Future<bool> hasValidCache(int page) async {
    final cacheBox = await box;
    final timestamp = cacheBox.get('$_timestampPrefix$page');

    if (timestamp == null) return false;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final isValid = DateTime.now().difference(cacheTime) < _cacheValidDuration;

    return isValid && cacheBox.containsKey('$_pagePrefix$page');
  }

  @override
  Future<void> clearCache() async {
    final cacheBox = await box;
    await cacheBox.clear();
  }
}
