import 'package:flutter/material.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';

abstract class _AppThemeContract {
  ThemeData main();
  ThemeData dark();
}

class AppTheme implements _AppThemeContract {
  @override
  ThemeData dark() {
    throw UnimplementedError();
  }

  @override
  ThemeData main() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.mainColor,
        elevation: 0,
      ),
      primaryColorDark: AppColors.darkBg,
      scaffoldBackgroundColor: AppColors.mainBgColor,
      errorColor: AppColors.mainColor,
      brightness: Brightness.light,
    );
  }
}
