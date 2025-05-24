import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/di/dependency_injection.dart';
import 'package:reels/features/reels/presentation/bloc/reels_bloc.dart';

import '../../features/reels/presentation/pages/reels_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SplashPage(),
        );
      case Routes.reels:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder:
              (_) => BlocProvider<ReelsBloc>(
                create:
                    (BuildContext context) => getIt<ReelsBloc>()..addGetReels(),
                child: const ReelsPage(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
