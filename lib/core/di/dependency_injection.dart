import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/reels/data/models/reel_model.dart';
import '../../features/reels/data/models/user_model.dart';
import 'dependency_injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReelModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await $initGetIt(getIt);
}
