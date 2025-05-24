import 'package:flutter/material.dart';

import 'app/presentation/reels_app.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ReelsApp());
}
