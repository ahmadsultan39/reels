import 'package:flutter/material.dart';

import 'colors_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorsManager.purple,
      scaffoldBackgroundColor: ColorsManager.white,
    );
  }

}
